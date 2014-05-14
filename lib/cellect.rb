require 'diff_set'
require 'zk'
require 'celluloid'
require 'celluloid/autostart'

module Cellect
  class << self
    attr_accessor :node_set
  end
  
  require 'cellect/node_set'
  require 'cellect/adapters'
  require 'cellect/project'
  require 'cellect/grouped_project'
  require 'cellect/user'
  require 'cellect/api'
  
  def self.ready?
    Project.all.each do |project|
      return false unless project.ready?
    end
    
    true
  rescue
    false
  end
  
  Cellect.node_set = NodeSet.supervise
end
