class Api::CalendarController < ApplicationController
    def get_client
        client = Google::Apis::CalendarV3::CalendarService.new
        client.authorization = credentials_for(Google::Apis::CalendarV3::AUTH_CALENDAR)
        client
    end

    def calendar_id
        Trip.find_by(id: params[:trip_id]).calendar_id
    end
    
    def create
        client = get_client()
        new_calendar = Google::Apis::CalendarV3::Calendar.new(
            summary: params[:summary],
        )
        result = client.insert_calendar(new_calendar)    
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
        calendar = get_calendar(self.calendar_id)
        calendar.summary = params[:summary]
    end

    def delete
        client = get_client()
        client.delete_calendar(self.calendar_id)
        redirect_to "/trips"
    end

    def create_event
        client = get_client()
        calendar = get_calendar(self.calendar_id)
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
