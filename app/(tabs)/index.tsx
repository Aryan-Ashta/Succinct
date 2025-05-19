import FullCalendar from '@fullcalendar/react'
import timeGridPlugin from '@fullcalendar/timegrid' // a plugin!
import bootstrap5Plugin from '@fullcalendar/bootstrap5'
//needs a way to add events manually

import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-icons/font/bootstrap-icons.css';

export default function Calendar() {
  return (
    <FullCalendar
        plugins={[ timeGridPlugin, bootstrap5Plugin]}
        themeSystem='bootstrap5'
      initialView="timeGridWeek"
      nowIndicator={true}
      events={[
    { title: 'event 3', date: '2025-05-20' },
    { title: 'event 2', date: '2025-05-20' }
  ]}
    />
  )
}