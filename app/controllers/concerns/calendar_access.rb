module CalendarAccess
    def get_client
        client = Google::Apis::CalendarV3::CalendarService.new
        client.authorization = credentials_for(Google::Apis::CalendarV3::AUTH_CALENDAR)
        client
    end

    def create_calendar(summary)
        client = get_client()
        new_calendar = Google::Apis::CalendarV3::Calendar.new(
            summary: summary,
        )
        client.insert_calendar(new_calendar)
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

        client.insert_event(calendar_id, event)
    end
end