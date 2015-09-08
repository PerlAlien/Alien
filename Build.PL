use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new
    ( module_name     => 'Alien',
      license         => 'perl',
      build_requires  => {
	Test::Pod => 0,
      },
      meta_merge => {
        resources => {
          x_MailingList => 'https://groups.google.com/forum/#!forum/perl5-alien',
          x_IRC => "irc://irc.perl.org/#native",
        },
      },
    )->create_build_script;
