import { CalendarBody, CalendarContainer, CalendarHeader } from '@howljs/calendar-kit';
import React from 'react';
//Should show events from plannin and should be able to add events manually
const Calendar = () => {
  return (
    <CalendarContainer numberOfDays={7}>
      <CalendarHeader />
      <CalendarBody />
    </CalendarContainer>
  );
};

export default Calendar;