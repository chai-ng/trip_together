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
end