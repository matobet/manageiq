class VmImportRequest < MiqRequest
  TASK_DESCRIPTION  = 'VM Transform'
  SOURCE_CLASS_NAME = 'Vm'
  ACTIVE_STATES     = %w(imported) + base_class::ACTIVE_STATES

  validates_inclusion_of :request_state, :in => %w(pending finished) + ACTIVE_STATES, :message => "should be pending, #{ACTIVE_STATES.join(", ")} or finished"
  validate               :must_have_user

  def my_zone
    vm = Vm.find_by(:id => options[:src_ids])
    vm.nil? ? super : vm.my_zone
  end

  def my_role
    # TODO: is this valid even when the `import_infra_vm` operations requires "admin" privilege?
    'ems_operations'
  end
end
