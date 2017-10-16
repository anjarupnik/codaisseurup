class Api::RegistrationsController < Api::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_event

  def create
    registration = @event.registrations.create(registration_params)

    if registration.save
      render status: 200, json: {
        message: "Registration successfully created",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "registration could not be created",
        errors: registration.errors
      }.to_json
    end
  end

  def update
    registration = @event.registrations.find(params[:id])

    if registration.update(registration_params)
      render status: 200, json: {
        message: "Registration successfully updated",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be updated",
        errors: registration.errors
      }.to_json
    end
  end


  def destroy
    registration = @event.registrations.find(params[:id])
    registration.destroy

    render status: 200, json: {
      message: "Registration successfully deleted",
      event: @event,
      registration: registration
    }.to_json
  end

  private

  def set_event
     @event = Event.find(params[:event_id])
   end

  def registration_params
    params.require(:registration).permit(:guests_count)
  end
end
