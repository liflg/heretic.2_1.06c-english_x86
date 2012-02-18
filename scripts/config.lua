Setup.Package
{
 	vendor = "liflg.org",
 	id = "heretic2",
 	description = "Heretic 2",
 	version = "1.06c-english",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "heretic2-disc",
		description = "Heretic 2 Loki disc",
		uniquefile = "README.more"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Heretic 2",
		bytes = 350244126, 
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Heretic 2",
                        genericname = "Heretic 2",
                        tooltip = "Play Heretic 2",
                        builtin_icon = false,
                        icon = "icon.xpm",
                        commandline = "%0/heretic2.dynamic.sh",
                        category = "Game",
                },

		Setup.File {
			source = "media://heretic2-disc/",
			wildcards = {"help" , "Manual.html", "README", "README.more", "icon.xpm", "icon.bmp"},
		},

		Setup.File {
			source = "media://heretic2-disc/data.tar.gz",
		},
		
--		Setup.File {
--			source = "media://heretic2-disc/bin/x86/glibc-2.1/",
--			permissions = "755",
--		},

--		Setup.File {
--			source = "media://heretic2-disc/bin-x86-glibc-2.1.tar.gz", --macht Ärger und da Patch pflicht, nicht nötig
--			permissions = "755",
--		},
		
		Setup.File 
		{
			wildcards = "heretic2.sh",
			permissions = "0755",
		},

		Setup.File
		{	
			wildcards = "README.liflg",
		},

		Setup.Option {
			value = true,
			required = true,
			description = "Install movies",
			tooltip = "Unselect this if it causes trouble",	
			bytes = 56901800,
			Setup.File {
				source = "media://heretic2-disc/",
				wildcards = "base/*",
			},
		},

		Setup.OptionGroup {
			description = "Select language",

			Setup.Option {
				value = true,
				description = "English",
				bytes = 0,
			},

			Setup.Option {
				description = "German",
				bytes = 43000000,
				Setup.File {
					source = "base:///german-1.pak.tar.xz/",
					destination = "base/",
				},
			},

			Setup.Option {
				description = "French",
				bytes = 43000000,
				Setup.File {
					source = "base:///french-1.pak.tar.xz/",
					destination = "base/",
				},
			},
	
			Setup.Option {
				description = "Italian",
				bytes = 43000000,
				Setup.File {
					source = "base:///italian-1.pak.tar.xz/",
					destination = "base/",
				},
			},
	
			Setup.Option {
				description = "Spanish",
				bytes = 43000000,
				Setup.File {
					source = "base:///spanish-1.pak.tar.xz/",
					destination = "base/",
				},
			},
		},

		Setup.Option {
			value = true,
			required = true,
			description = "Install additional deathmatch maps",
			bytes = 14141440,
			Setup.File {
				source = "base:///dm-maps.tar.xz/",
				allowoverwrite = true,
			},
		},

		Setup.Option {
			value = true,
			required = true,
			description = "Apply Patch 1.06c",
			tooltip = "Latest update from Loki",
			bytes = 5208115,
			Setup.File{
				allowoverwrite = true,
				source = "base:///patch-1.06c.tar.xz/",
				filter = function(dest)
					if ( string.match( dest, "heretic2" ) ) then
						return dest, "0755"
					end
					if ( string.match( dest, "heretic2.dynamic" ) ) then
						return dest, "0755"
					end
					return dest
				end
			},
		
			Setup.File 
			{
				wildcards = "heretic2.dynamic.sh",
				permissions = "0755",
			},

			Setup.File
			{
				source = "base:///libaudiofile0_0.2.6-7_i386.tar.xz/",
			},

			Setup.File
			{
				source = "base:///libesd-alsa0_0.2.36-3_i386.tar.xz/",
			},
		},
				
--		Setup.Option {
--			value = false,
--			description = "Install Loki-Compat libs.",
--			tooltip = "Allows Heretic 2 to run under new distributions",
--			bytes = 5477376, 
--			Setup.File{
--				allowoverwrite = true,
--				source = "base:///loki_compat_libs-1.3.tar.bz2/",
--			},
--		},
	},
}			
