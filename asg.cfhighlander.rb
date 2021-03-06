CfhighlanderTemplate do

  DependsOn 'vpc@1.5.0'

  Name 'asg'

  Parameters do
    ComponentParam 'EnvironmentName', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', isGlobal: true
    ComponentParam 'NetworkPrefix', isGlobal: true
    ComponentParam 'StackOctet', isGlobal: true
    ComponentParam 'VPCId', type: 'AWS::EC2::VPC::Id'
    maximum_availability_zones.times do |az|
      ComponentParam "SubnetCompute#{az}"
    end
    security_groups.each do |name, sg|
      ComponentParam name
    end if defined? security_groups
    ComponentParam 'Ami'
    ComponentParam 'InstanceType'
    ComponentParam 'KeyName'
    ComponentParam 'MinSize'
    ComponentParam 'MaxSize'
    ComponentParam 'HealthCheckType', 'EC2', allowedValues: ['EC2','ELB']

    loadbalancers.each do |lb|
      ComponentParam lb
    end if defined? loadbalancers

    targetgroups.each do |tg|
      ComponentParam tg
    end if defined? targetgroups

  end

end
