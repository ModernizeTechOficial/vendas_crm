import { PageTemplate } from '@/components/page-template';
import { usePage, router } from '@inertiajs/react';
import { Card } from '@/components/ui/card';
import { useTranslation } from 'react-i18next';
import { useState } from 'react';
import FullCalendar from '@fullcalendar/react';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import { Dialog, DialogContent, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Calendar, Phone, CheckSquare, User, Clock, ExternalLink } from 'lucide-react';
import { hasPermission } from '@/utils/authorization';

export default function CalendarIndex() {
  const { t } = useTranslation();
  const { events, auth } = usePage().props as any;
  const permissions = auth?.permissions || [];
  const [selectedEvent, setSelectedEvent] = useState(null);
  const [showModal, setShowModal] = useState(false);

  const handleEventClick = (info: any) => {
    info.jsEvent.preventDefault();
    const event = info.event;
    setSelectedEvent({
      title: event.title,
      start: event.start,
      end: event.end,
      type: event.extendedProps.type,
      ...event.extendedProps
    });
    setShowModal(true);
  };

  const getEventIcon = (type: string) => {
    switch (type) {
      case 'meeting': return <Calendar className="h-4 w-4" />;
      case 'call': return <Phone className="h-4 w-4" />;
      case 'task': return <CheckSquare className="h-4 w-4" />;
      default: return <Calendar className="h-4 w-4" />;
    }
  };

  const getEventColor = (type: string) => {
    switch (type) {
      case 'meeting': return 'bg-blue-100 text-blue-800';
      case 'call': return 'bg-green-100 text-green-800';
      case 'task': return 'bg-amber-100 text-amber-800';
      default: return 'bg-gray-100 text-gray-800';
    }
  };

  const getStatusClasses = (status: string, eventType: string) => {
    if (eventType === 'meeting') {
      // Meeting status colors
      switch (status?.toLowerCase()) {
        case 'planned':
          return 'bg-blue-50 text-blue-700 ring-blue-600/20';
        case 'held':
          return 'bg-green-50 text-green-700 ring-green-600/20';
        case 'not_held':
          return 'bg-red-50 text-red-700 ring-red-600/20';
        default:
          return 'bg-gray-50 text-gray-700 ring-gray-600/20';
      }
    } else if (eventType === 'call') {
      // Call status colors
      switch (status?.toLowerCase()) {
        case 'planned':
          return 'bg-blue-50 text-blue-700 ring-blue-600/20';
        case 'held':
          return 'bg-green-50 text-green-700 ring-green-600/20';
        case 'not_held':
          return 'bg-red-50 text-red-700 ring-red-600/20';
        default:
          return 'bg-gray-50 text-gray-700 ring-gray-600/20';
      }
    } else if (eventType === 'task') {
      // Task status colors
      switch (status?.toLowerCase()) {
        case 'to_do':
          return 'bg-gray-50 text-gray-700 ring-gray-600/20';
        case 'in_progress':
          return 'bg-blue-50 text-blue-700 ring-blue-600/20';
        case 'review':
          return 'bg-yellow-50 text-yellow-700 ring-yellow-600/20';
        case 'done':
          return 'bg-green-50 text-green-700 ring-green-600/20';
        default:
          return 'bg-gray-50 text-gray-700 ring-gray-600/20';
      }
    }
    return 'bg-gray-50 text-gray-700 ring-gray-600/20';
  };

  const breadcrumbs = [
    { title: t('Dashboard'), href: route('dashboard') },
    { title: t('Calendar') }
  ];

  return (
    <PageTemplate
      title={t('Calendar')}
      breadcrumbs={breadcrumbs}
    >
      <Card className="p-4">
        <div className="mb-4 flex flex-wrap gap-4 justify-end">
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded" style={{backgroundColor: '#3b82f6'}}></div>
            <span className="text-sm">{t('Meetings')}</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded" style={{backgroundColor: '#10b981'}}></div>
            <span className="text-sm">{t('Calls')}</span>
          </div>
          <div className="flex items-center gap-2">
            <div className="w-3 h-3 rounded" style={{backgroundColor: '#f59e0b'}}></div>
            <span className="text-sm">{t('Tasks')}</span>
          </div>
        </div>
        <FullCalendar
          plugins={[dayGridPlugin, timeGridPlugin, interactionPlugin]}
          initialView="dayGridMonth"
          headerToolbar={{
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
          }}
          events={events}
          eventClick={handleEventClick}
          eventTimeFormat={{
            hour: '2-digit',
            minute: '2-digit',
            meridiem: 'short'
          }}
          height="auto"
          aspectRatio={1.8}
          eventDisplay="block"
          dayMaxEvents={1}
          moreLinkClick="popover"
          eventContent={(eventInfo) => {
            const isNotHeld = eventInfo.event.extendedProps.status === 'not_held';
            return (
              <div className="p-1 overflow-hidden cursor-pointer hover:opacity-80">
                <div className={`font-medium text-xs truncate ${isNotHeld ? 'line-through' : ''}`}>
                  {eventInfo.event.title}
                </div>
                {eventInfo.view.type !== 'dayGridMonth' && eventInfo.event.extendedProps.parent_name && (
                  <div className={`text-xs truncate ${isNotHeld ? 'line-through' : ''}`}>
                    {eventInfo.event.extendedProps.parent_name}
                  </div>
                )}
              </div>
            );
          }}
        />
      </Card>

      {/* Event Details Modal */}
      <Dialog open={showModal} onOpenChange={setShowModal}>
        <DialogContent className="max-w-md">
          <DialogHeader>
            <DialogTitle className="flex items-center gap-2">
              {selectedEvent && getEventIcon(selectedEvent.type)}
              {selectedEvent?.title}
            </DialogTitle>
          </DialogHeader>
          
          {selectedEvent && (
            <div className="space-y-4">
              <div className="flex items-center gap-2">
                <Badge className={getEventColor(selectedEvent.type)}>
                  {t(selectedEvent.type.charAt(0).toUpperCase() + selectedEvent.type.slice(1))}
                </Badge>
              </div>
              
              <div className="space-y-3">
                <div className="flex items-center gap-2 text-sm">
                  <Clock className="h-4 w-4 text-gray-500" />
                  <span>
                    {selectedEvent.start && new Date(selectedEvent.start).toLocaleString()}
                    {selectedEvent.end && ` - ${new Date(selectedEvent.end).toLocaleTimeString()}`}
                  </span>
                </div>
                
                {selectedEvent.status && (
                  <div className="flex items-center gap-2 text-sm">
                    <strong>{t('Status')}:</strong>
                    <span className={`inline-flex items-center rounded-md px-2 py-1 text-xs font-medium ring-1 ring-inset ${getStatusClasses(selectedEvent.status, selectedEvent.type)}`}>
                      {selectedEvent.type === 'meeting' || selectedEvent.type === 'call' ? (
                        selectedEvent.status === 'planned' ? t('Planned') :
                        selectedEvent.status === 'held' ? t('Held') :
                        selectedEvent.status === 'not_held' ? t('Not Held') :
                        selectedEvent.status
                      ) : selectedEvent.type === 'task' ? (
                        selectedEvent.status === 'to_do' ? t('To Do') :
                        selectedEvent.status === 'in_progress' ? t('In Progress') :
                        selectedEvent.status === 'review' ? t('Review') :
                        selectedEvent.status === 'done' ? t('Done') :
                        selectedEvent.status
                      ) : t(selectedEvent.status.replace('_', ' ').replace(/\b\w/g, l => l.toUpperCase()))}
                    </span>
                  </div>
                )}
                
                {selectedEvent.description && (
                  <div className="text-sm">
                    <strong className="text-gray-700">{t('Description')}:</strong>
                    <p className="text-gray-600 mt-1">{selectedEvent.description}</p>
                  </div>
                )}
                
                {selectedEvent.location && (
                  <div className="text-sm">
                    <strong className="text-gray-700">{t('Location')}:</strong>
                    <span className="text-gray-600 ml-2">{selectedEvent.location}</span>
                  </div>
                )}
                
                {selectedEvent.parent_name && (
                  <div className="text-sm">
                    <strong className="text-gray-700">{t('Related to')}:</strong>
                    <span className="text-gray-600 ml-2">{selectedEvent.parent_name}</span>
                  </div>
                )}
              </div>
              
              {(() => {
                const eventType = selectedEvent.type;
                const hasViewPermission = 
                  (eventType === 'meeting' && hasPermission(permissions, 'view-meetings')) ||
                  (eventType === 'call' && hasPermission(permissions, 'view-calls')) ||
                  (eventType === 'task' && hasPermission(permissions, 'view-project-tasks'));
                
                return hasViewPermission ? (
                  <div className="flex justify-end pt-4 border-t">
                    <Button 
                      onClick={() => {
                        if (eventType === 'meeting') {
                          router.get(route('meetings.show', selectedEvent.meeting_id));
                        } else if (eventType === 'call') {
                          router.get(route('calls.show', selectedEvent.call_id));
                        } else if (eventType === 'task') {
                          router.get(route('project-tasks.show', selectedEvent.task_id));
                        }
                        setShowModal(false);
                      }}
                      className="flex items-center gap-2"
                    >
                      <ExternalLink className="h-4 w-4" />
                      {t('View Details')}
                    </Button>
                  </div>
                ) : null;
              })()}
            </div>
          )}
        </DialogContent>
      </Dialog>
    </PageTemplate>
  );
}