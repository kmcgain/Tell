class ObjectHasher
  def self.Hash(objToHash)
    hash = {}
    objToHash.instance_variables.each{|var| hash[var.to_s.delete("@")] = objToHash.instance_variable_get(var)}
    return {"TypeName" => objToHash.class.name, "Content" => hash}
  end
end