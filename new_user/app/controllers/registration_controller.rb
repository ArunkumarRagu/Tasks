class RegistrationController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:query].present?
      @result = search(params[:query])
    else
      @result = []
    end
    session.clear
  end

  def personal
    @personal = Personal.new(session[:personal] || {})
  end

  def address
    @address = Address.new(session[:address] || {})
  end

  def official
    @official = Official.new(session[:official] || {})
  end

  def create_personal
    @personal = Personal.new(personal_params)
    
    if @personal.valid?
      session[:personal] = personal_params
      redirect_to address_path
    else
      render :personal
    end
  end

  def create_address
    @address = Address.new(address_params)

    if @address.valid?
      session[:address] = address_params
      redirect_to official_path
    else
      render :address
    end
  end

  def create_official
    @personal = Personal.new(session[:personal] || {})
    @address = Address.new(session[:address] || {})
    @official = Official.new(official_params)
    if @official.valid?
      @personal.save
      @address.save
      @official.save
        if @personal.save && @address.save && @official.save 
          solr = RSolr.connect(url: 'http://localhost:8983/solr/user_management')
          solr.add([
            @personal.attributes.merge(id: @personal.id),
            @address.attributes.merge(id: @address.id),
            @official.attributes.merge(id: @official.id)
              ])
          solr.commit

      session[:form_data] = nil
      session[:address_data] = nil
      session[:official_data] = nil

          redirect_to root_path, notice: "Form submitted successfully!"
        else
          render :official
        end
    else
      render :official
    end
  end



  def search(query)
    solr = RSolr.connect(url: 'http://localhost:8983/solr/user_management')
    response = solr.get('select', params: { q:query})
    results = response['response']['docs']
    return results
  rescue RSolr::Error::ConnectionRefused => e
    return []
  end
  
  private
  

def personal_params
  params.require(:personal).permit(:firstname, :lastname, :email, :phone, :dob,
   :tenth_mark, :twelfth_mark, :school_name, :college_degree, :college_name, :cgpa,
    :father_name, :mother_name, :father_mobile, :mother_mobile, :caste, :religion,
     :username, :password, :marital_status, :instagram_acc, :twitter_acc, :facebook_acc,
      :gender, :community)
end

def address_params
  params.require(:address).permit(:door_number, :floor_number, :building_name,
   :street_name, :area, :village, :town, :city, :pincode, :landmark, :district, :state,
    :country, :address_type)
end

def official_params
  params.require(:official).permit(:company, :role, :employee_id, :employee_mail,
    :laptop_serial, :laptop_model, :laptop_brand, :laptop_mac, :waterbottle, :headset,
    :mobile, :bag, :experience, :account_holder_name, :account_number, :bank_name,
    :branch, :ifsc_code)
end

end

