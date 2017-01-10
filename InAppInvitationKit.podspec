Pod::Spec.new do |s|
s.name          = 'InAppInvitationKit'
s.version       = '0.1.0'
s.summary       = 'A simple invitation / sharing (Message, Email, WhatsApp, Facebook and Twitter, Viber ) UI library similar to WhatsApp app invitation feature.'
s.homepage      = 'https://github.com/vineetchoudhary/InAppInvitation'
s.license       = { :type => 'MIT', :file => 'LICENSE' }
s.author        = { 'Vineet Choudhary' => 'vineetchoudhary@live.in' }

s.ios.deployment_target = '10.0'
s.source        = { :git => 'https://github.com/vineetchoudhary/InAppInvitation.git', :tag => s.version }
s.source_files  = ['InAppInvitationKit/InAppInvitationKit/*', 'InAppInvitationKit/InAppInvitationKit/ContactViewController/*', InAppInvitationKit/InAppInvitationKit/ContactViewController/ContactTableCell/*']
end
