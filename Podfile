# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
use_frameworks!


def mindbox
   pod 'Mindbox'
end

def mindbox_notifications
  pod 'MindboxNotifications'
end

target 'Mindbox Sample App' do
  # Comment the next line if you don't want to use dynamic frameworks
  mindbox
end

# Pods for Mindbox Sample App
target 'MindboxNotificationServiceExtension' do
  mindbox_notifications
 end
 
 target 'MindboxNotificationContentExtension' do
   mindbox_notifications
 end
