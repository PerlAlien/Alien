use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new
    ( module_name     => 'Alien',
      license         => 'perl',
      build_requires  => {
	Test::Pod => 0,
      },
    )->create_build_script;
