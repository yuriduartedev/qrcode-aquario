exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        "js/app.js": [
          /^js\//,          
          "!js/jquery.min.js",
          "!js/bootstrap.bundle.min.js",
          "!js/jquery.easing.min.js",
          "!js/sb-admin-2.min.js",
          "!js/Chart.min.js",
          "!js/chart-area-demo.js",
          "!js/chart-pie-demo.js",          
        ],
        "js/vendor.js": /^(vendor|deps|node_modules).*/,
        "js/admin.js": [
          "js/jquery.min.js",
          "js/bootstrap.bundle.min.js",
          "js/jquery.easing.min.js",
          "js/sb-admin-2.min.js",
          "js/Chart.min.js",
          "js/chart-area-demo.js",
          "js/chart-pie-demo.js"
        ]
      },
      order: {
        before: [
          "js/jquery.min.js",
          "js/bootstrap.bundle.min.js",
          "js/jquery.easing.min.js",
          "js/sb-admin-2.min.js",
          "js/Chart.min.js",
          "js/chart-area-demo.js",
          "js/chart-pie-demo.js"
        ]
      }
      // To use a separate vendor.js bundle, specify two files path
      // http://brunch.io/docs/config#-files-
      // joinTo: {
      //   "js/app.js": /^js/,
      //   "js/vendor.js": /^(?!js)/
      // }
      //
      // To change the order of concatenation of files, explicitly mention here
      // order: {
      //   before: [
      //     "vendor/js/jquery-2.1.1.js",
      //     "vendor/js/bootstrap.min.js"
      //   ]
      // }
    },
    stylesheets: {
      joinTo: {        
        "css/app.css": [
          /^css\//, 
          "!css/admin.css", 
          "!css/login.css",
          "!css/sb-admin-2.min.css"
        ],
        "css/admin.css": [
          "css/sb-admin-2.min.css",
          "css/admin.css",
          "css/login.css"          
        ]
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/assets/static". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(static)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: ["static", "css", "js", "vendor"],
    // Where to compile files to
    public: "../priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/vendor/]
    },
    copycat: {
      "js/particles": [
        "js/particles"
      ]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["js/app"]
    }
  },

  npm: {
    enabled: true,
    globals: {
      jQuery: 'jquery',
      $: 'jquery'
    }
  }
};
