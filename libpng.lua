-- scaffold geniefile for libpng

libpng_script = path.getabsolute(path.getdirectory(_SCRIPT))
libpng_root = path.join(libpng_script, "libpng")

libpng_includedirs = {
	path.join(libpng_script, "config"),
	libpng_root,
}

libpng_libdirs = {}
libpng_links = {}
libpng_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { libpng_includedirs }
	end,

	_add_defines = function()
		defines { libpng_defines }
	end,

	_add_libdirs = function()
		libdirs { libpng_libdirs }
	end,

	_add_external_links = function()
		links { libpng_links }
	end,

	_add_self_links = function()
		links { "libpng" }
	end,

	_create_projects = function()

project "png"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		libpng_includedirs,
	}

	defines {}

	files {
		path.join(libpng_script, "config", "**.h"),
		path.join(libpng_root, "**.h"),
		path.join(libpng_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
