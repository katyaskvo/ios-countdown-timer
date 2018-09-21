platform :ios, '11.0'

workspace 'KidsTimer'

target 'CountdownTimer' do
  use_frameworks!

  pod 'CircleProgressBar', :inhibit_warnings => true
end

def testing_pods
    pod 'Quick', :inhibit_warnings => true
    pod 'Nimble'
end

target 'UnitSpecs' do
    testing_pods
end
