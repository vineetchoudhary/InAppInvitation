Pod::Spec.new do |s|
    s.name                      = 'InAppInvitationKit'
    s.version                   = '0.1.0'
    s.summary                   = 'A simple invitation / sharing (Message, Email, WhatsApp, Facebook and Twitter, Viber ) UI library similar to WhatsApp app invitation feature.'
    s.description               = 'A simple invitation / sharing (Message, Email, WhatsApp, Facebook and Twitter, Viber ) UI library similar to WhatsApp app invitation feature.'
    s.homepage                  = 'https://github.com/vineetchoudhary/InAppInvitation'
    s.documentation_url         = 'https://github.com/vineetchoudhary/InAppInvitation'
    s.license                   = { :type => 'MIT', :file => 'LICENSE' }
    s.author                    = { 'Vineet Choudhary' => 'vineetchoudhary@live.in' }
    s.platform                  = :ios, '8.0'
    s.source                    = { :http => "https://github.com/vineetchoudhary/InAppInvitation/releases/download/#{s.version}/InAppInvitationKit.framework.zip" }
    s.frameworks                = 'Social', 'UIKit'
    s.vendored_frameworks       = 'InAppInvitationKit/InAppInvitationKit.framework'
end
