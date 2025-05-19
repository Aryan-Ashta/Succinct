import { CalendarBody, CalendarContainer, CalendarHeader } from '@howljs/calendar-kit';
import React from 'react';

//Should show events from plannin and should be able to add events manually
const MyCalendar = () => {
  const handleDragCreateStart = (start: any) => {
    console.log("Started creating event at:", start);
    // You can use this to show a UI indicator that event creation has started
  };

  const handleDragCreateEnd = (event: any) => {
    console.log("New event:", event);
    // Here you would typically add the new event to your events array
    // and possibly open a modal for the user to add more details
    
  };

  return (
    <CalendarContainer
      allowDragToCreate={true}
      onDragCreateEventStart={handleDragCreateStart}
      onDragCreateEventEnd={handleDragCreateEnd}
      // ... other props
    >
      <CalendarHeader />
      <CalendarBody />
    </CalendarContainer>
  );
};

export default MyCalendar;