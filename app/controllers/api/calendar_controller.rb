class Api::CalendarController < ApplicationController
    include CalendarAccess
    
    def calendar_id
        Trip.find_by(id: params[:trip_id]).calendar_id
    end
    
    def create
        result = create_calendar(params[:summary])
        render json: result.id
    end
    
    def show
        # return all events associated with this trip
        client = get_client()
        calendar_id = Trip.find_by(id: params[:trip_id]).calendar_id
        @result = client.list_events(self.calendar_id,
                                        single_events: true,
                                        order_by: 'startTime',
                                        time_min: Time.now.iso8601)
        render json: @result
    end

    def update
        client = get_client()
        calendar = client.get_calendar(self.calendar_id)
        calendar.summary = params[:summary]
    end

    def delete
        client = get_client()
        client.delete_calendar(self.calendar_id)
        redirect_to "/trips"
    end

    def create_event
        client = get_client()
        calendar = client.get_calendar(self.calendar_id)

        event = Google::Apis::CalendarV3::Event.new({
            summary: params[:summary],
            location: params[:location],
            description: params[:description],
            start: {
                date_time: DateTime.parse(params[:start_date]+ " " + params[:start_time]).rfc3339,
                time_zone:'Australia/Melbourne'
            },
            'end': {
                date_time: DateTime.parse(params[:end_date]+ " " + params[:end_time]).rfc3339,
                time_zone: 'Australia/Melbourne'
            }
        })

        result = client.insert_event(calendar_id, event)
        # redirect_to "#{result.html_link}"
        redirect_to "/trips/#{params[:trip_id]}/calendar"
    end

    def view_event
        client = get_client()
        result = client.get_event(self.calendar_id, params[:id])
        render json: result
    end

    def update_event
        client = get_client()
        updated_event = view_event()
        # insert changes here
        result = client.update_event(calendar_id, params[:id], updated_event)
    end

    def delete_event
        client = get_client()
        client.delete_event(calendar_id, params[:id])
    end
end
