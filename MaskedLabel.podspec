Pod::Spec.new do |s|
  s.name             = 'MaskedLabel'
  s.version          = '0.9.0'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.summary          = 'MaskedLabel is a UILabel subclass that allows you to easily apply a gradient to its text or to make it transparent.'
  s.homepage         = 'https://github.com/darincon/MaskedLabel'
  s.author           = { 'darincon' => 'drincon@scirestudios.com' }
  s.social_media_url = 'https://twitter.com/_diego_rincon'
  s.source           = { :git => 'https://github.com/darincon/MaskedLabel.git', :tag => '0.9.0' }

  s.ios.deployment_target = '10.0'

  s.source_files     = 'MaskedLabel/*.swift'

  s.requires_arc = true
end
