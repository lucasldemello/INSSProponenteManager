class ProponentWorker
  include Sidekiq::Worker

  def perform(proponent_id, salary)
    proponent = Proponent.find(proponent_id)
    inss_discount = InssCalcService.new(salary.to_f).call


    proponent.update(salary: salary.to_f, inss_discount: inss_discount)
  end
end
