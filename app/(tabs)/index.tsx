import bootstrap5Plugin from '@fullcalendar/bootstrap5';
import FullCalendar from '@fullcalendar/react';
import timeGridPlugin from '@fullcalendar/timegrid'; // a plugin!
//needs a way to add events manually

import 'bootstrap-icons/font/bootstrap-icons.css';
import 'bootstrap/dist/css/bootstrap.css';
import { useState } from 'react';
import { Button } from 'react-bootstrap';

function useCalendarEvents() {
  const [events, setEvents] = useState<{ title: string; start: string; end?: string }[]>([]);

  const addEvent = (event: { title: string; start: string; end?: string }) => {
    setEvents((prev) => [...prev, event]);
  };

  return { events, addEvent };
}

const { events, addEvent } = useCalendarEvents();

function handleAddEvent() {
  const title = prompt('Event Title:');
  const start = prompt('Start Date/Time (YYYY-MM-DDTHH:mm):');
  if (title && start) {
    addEvent({ title, start });
  }
}
export default function Calendar() {

<Button
  onClick={handleAddEvent}
  variant="primary"
  aria-label="Add Event"
>
  Add event
</Button>

  return (
    <FullCalendar
        plugins={[ timeGridPlugin, bootstrap5Plugin]}
        themeSystem=''
      initialView="timeGridWeek"
      nowIndicator={true}
      events={[
    
  ]}
    />
    
  )
}