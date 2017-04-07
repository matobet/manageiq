class VmImportTask < MiqRequestTask
  alias_attribute :vm, :source

  validate :validate_request_type, :validate_state

  # TODO: do we need this?
  # AUTOMATE_DRIVES = true

  def self.base_model
    VmImportTask
  end

  def self.get_description(req_obj)
    # TODO: what should be contained in the description?
  end

  def after_request_task_create
    update_attribute(:description, get_description)
  end

  def do_request
    # TODO: here move relevant code from
    # manageiq-content/content/automate/ManageIQ/Infrastructure/VM/Transform/Import.class/__methods__/import_infra_vm.rb
  end
end
