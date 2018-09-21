platform :ios, '11.0'

workspace 'KidsTimer'

target 'CountdownTimer' do
  use_frameworks!

  pod 'CircleProgressBar', '~> 0.32', :inhibit_warnings => true
end

def testing_pods
    pod 'Quick'
    pod 'Nimble'
end

target 'UnitSpecs' do
    testing_pods
end
