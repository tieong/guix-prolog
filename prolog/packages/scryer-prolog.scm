(define-module (prolog packages scryer-prolog)
  #:use-module (gnu packages crates-io)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages rust)
  #:use-module (gnu packages m4)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system cargo)
  #:use-module ((guix licenses)
		#:prefix license:)
  #:use-module (guix git-download)
  #:use-module (guix build utils))

(define-public rust-typenum-1.14.0
  (package
    (inherit rust-typenum-1)
    (name "rust-typenum")
    (version "1.14.0")
    (source
      (origin
	(inherit (package-source rust-typenum-1))
	(uri (crate-uri "typenum" version))
	(file-name (string-append name "-" version ".tar.gz"))
	(sha256
	 (base32
	  "1v2r349b2dr0pknpjk3nkrbi3mhaa3wl7zi7bdbla4zmcni0hdxn"))))))

(define-public rust-crypto-common-0.1.3
  (package
    (inherit rust-crypto-common-0.1)
    (name "rust-crypto-common")
    (version "0.1.3")
    (source
     (origin
       (inherit (package-source rust-crypto-common-0.1))
       (uri (crate-uri "crypto-common" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
	(base32
	 "1s1wpm88qlrp079mzh3dlxm9vbqs4ch016yp9pzhcdjygfi2r5ap"))))))

(define-public rust-lock-api-0.4.6
  (package
    (inherit rust-lock-api-0.4)
    (name "rust-lock-api")
    (version "0.4.6")
    (source
     (origin
       (inherit (package-source rust-lock-api-0.4))
       (uri (crate-uri "lock_api" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
	(base32
	 "0frbbqqiwngg33xrc69xagi4rqqk62msllr7z95mlbjaxzbkv548"))))))

(define-public rust-predicates-core-1.0.6
  (package
    (inherit rust-predicates-core-1)
    (name "rust-predicates-core")
    (version "1.0.6")
    (source (origin
	     (inherit (package-source rust-predicates-core-1))
	     (uri (crate-uri "predicates-core" version))
	     (file-name (string-append name "-" version ".tar.gz"))
	     (sha256
	      (base32
	       "0x7ij95n63mhgkyrb7hly5ngm41mwfsassfvnjz7lbk10wk0755p"))))))

(define-public rust-to-syn-value-derive-0.1
  (package
    (name "rust-to-syn-value-derive")
    (version "0.1.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "to-syn-value_derive" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1g6crhgkvdpgrxd8lnnmdi9kqqjjld39s73jsg0nid81vv3dwkyd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/mthom/to-syn-value_derive")
    (synopsis
     "Defines the trait targeted by the derive macro defined in to-syn-value.")
    (description
     "Defines the trait targeted by the derive macro defined in to-syn-value.")
    (license license:bsd-3)))

(define-public rust-to-syn-value-0.1
  (package
    (name "rust-to-syn-value")
    (version "0.1.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "to-syn-value" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0iw4wqhpc3axcal3zxzdccvg9sn6jr1738sasyyr6iwa22sbgp25"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-syn" ,rust-syn-1)
		       ("rust-to-syn-value-derive" ,rust-to-syn-value-derive-0.1))))
    (home-page "https://github.com/mthom/to-syn-value")
    (synopsis
     "Defines a derive macro to implement a trait converting values to instances of syn::ToDeriveInput.")
    (description
     "Defines a derive macro to implement a trait converting values to instances of
syn::ToDeriveInput.")
    (license license:bsd-3)))

;; TODO inherit
(define-public rust-strum-macros-0.23
  (package
   (name "rust-strum-macros")
   (version "0.23.1")
   (source (origin
	    (method url-fetch)
	    (uri (crate-uri "strum_macros" version))
	    (file-name (string-append name "-" version ".tar.gz"))
	    (sha256
	     (base32
	      "0f2sr3nnhbfpg92ralzqka0wb90nz8ks3sfdk5hylp61x5zdrc2v"))))
   (build-system cargo-build-system)
   (arguments
    `(#:skip-build? #t
      #:cargo-inputs (("rust-heck" ,rust-heck-0.3)
		      ("rust-proc-macro2" ,rust-proc-macro2-1)
		      ("rust-quote" ,rust-quote-1)
		      ("rust-rustversion" ,rust-rustversion-1)
		      ("rust-syn" ,rust-syn-1))))
   (home-page "https://github.com/Peternator7/strum")
   (synopsis "Helpful macros for working with enums and strings")
   (description "Helpful macros for working with enums and strings")
   (license license:expat)))

;; TODO inherit
(define-public rust-strum-0.23
  (package
   (name "rust-strum")
   (version "0.23.0")
   (source (origin
	    (method url-fetch)
	    (uri (crate-uri "strum" version))
	    (file-name (string-append name "-" version ".tar.gz"))
	    (sha256
	     (base32
	      "1fvhkg7di4psfw289v2flv19i28rcflq1g1z3n2rl76iqy8lpqfa"))))
   (build-system cargo-build-system)
   (arguments
    `(#:skip-build? #t
      #:cargo-inputs (("rust-strum-macros" ,rust-strum-macros-0.23))))
   (home-page "https://github.com/Peternator7/strum")
   (synopsis "Helpful macros for working with enums and strings")
   (description "Helpful macros for working with enums and strings")
   (license license:expat)))

(define-public rust-libsodium-sys-0.2
  (package
    (name "rust-libsodium-sys")
    (version "0.2.7")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "libsodium-sys" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1zcjka23grayr8kjrgbada6vwagp0kkni9m45v0gpbanrn3r6xvb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cc" ,rust-cc-1)
		       ("rust-libc" ,rust-libc-0.2)
		       ("rust-pkg-config" ,rust-pkg-config-0.3)
		       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://github.com/sodiumoxide/sodiumoxide.git")
    (synopsis "FFI binding to libsodium")
    (description "FFI binding to libsodium")
    (license (list license:expat license:asl2.0))))

(define-public rust-sodiumoxide-0.2
  (package
    (name "rust-sodiumoxide")
    (version "0.2.7")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "sodiumoxide" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0a00rcp2vphrs8qh0477rzs6lhsng1m5i0l4qamagnf2nsnf6sz2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-ed25519" ,rust-ed25519-1)
		       ("rust-cc" ,rust-cc-1)
		       ("rust-libc" ,rust-libc-0.2)
		       ("rust-libsodium-sys" ,rust-libsodium-sys-0.2)
		       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/sodiumoxide/sodiumoxide")
    (synopsis "Fast cryptographic library for Rust (bindings to libsodium)")
    (description "Fast cryptographic library for Rust (bindings to libsodium)")
    (license (list license:expat license:asl2.0))))

;; TODO inherit
(define-public rust-sha3-0.8
  (package
   (name "rust-sha3")
   (version "0.8.2")
   (source (origin
	    (method url-fetch)
	    (uri (crate-uri "sha3" version))
	    (file-name (string-append name "-" version ".tar.gz"))
	    (sha256
	     (base32
	      "1kryhpjafv3k1x9fj13psrqhrvkjigswm564kfapqfifg87bq9nx"))))
   (build-system cargo-build-system)
   (arguments
    `(#:skip-build? #t
      #:cargo-inputs (("rust-block-buffer" ,rust-block-buffer-0.7)
		      ("rust-byte-tools" ,rust-byte-tools-0.3)
		      ("rust-digest" ,rust-digest-0.8)
		      ("rust-keccak" ,rust-keccak-0.1)
		      ("rust-opaque-debug" ,rust-opaque-debug-0.2))))
   (home-page "https://github.com/RustCrypto/hashes")
   (synopsis "SHA-3 (Keccak) hash function")
   (description "SHA-3 (Keccak) hash function")
   (license (list license:expat license:asl2.0))))

(define-public rust-select-0.4
  (package
    (name "rust-select")
    (version "0.4.3")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "select" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0sz7bf6jlyl6flh4rvcmr67q773rq96lxlzqj0gx2211qrc5jr5c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bit-set" ,rust-bit-set-0.5)
		       ("rust-html5ever" ,rust-html5ever-0.23))))
    (home-page "https://github.com/utkarshkukreti/select.rs")
    (synopsis
     "A library to extract useful data from HTML documents, suitable for web scraping.")
    (description
     "This package provides a library to extract useful data from HTML documents,
suitable for web scraping.")
    (license license:expat)))

;; Inherit
(define-public rust-ryu-1
  (package
   (name "rust-ryu")
   (version "1.0.13")
   (source (origin
	    (method url-fetch)
	    (uri (crate-uri "ryu" version))
	    (file-name (string-append name "-" version ".tar.gz"))
	    (sha256
	     (base32
	      "0hchlxvjmsz51l06c7r8zwj45pm8bhc3x3czcih27rkx8v03j4zr"))))
   (build-system cargo-build-system)
   (arguments
    `(#:skip-build? #t
      #:cargo-inputs (("rust-no-panic" ,rust-no-panic-0.1))))
   (home-page "https://github.com/dtolnay/ryu")
   (synopsis "Fast floating point to string conversion")
   (description "Fast floating point to string conversion")
   (license (list license:asl2.0 license:boost1.0))))

;; inherit
(define-public rust-num-integer-0.1
  (package
   (name "rust-num-integer")
   (version "0.1.45")
   (source (origin
	    (method url-fetch)
	    (uri (crate-uri "num-integer" version))
	    (file-name (string-append name "-" version ".tar.gz"))
	    (sha256
	     (base32
	      "1ncwavvwdmsqzxnn65phv6c6nn72pnv9xhpmjd6a429mzf4k6p92"))))
   (build-system cargo-build-system)
   (arguments
    `(#:skip-build? #t
      #:cargo-inputs (("rust-autocfg" ,rust-autocfg-1)
		      ("rust-num-traits" ,rust-num-traits-0.2))))
   (home-page "https://github.com/rust-num/num-integer")
   (synopsis "Integer traits and functions")
   (description "Integer traits and functions")
   (license (list license:expat license:asl2.0))))

;; inherit
(define-public rust-gmp-mpfr-sys-1
  (package
   (name "rust-gmp-mpfr-sys")
   (version "1.5.2")
   (source (origin
	    (method url-fetch)
	    (uri (crate-uri "gmp-mpfr-sys" version))
	    (file-name (string-append name "-" version ".tar.gz"))
	    (sha256
	     (base32
	      "0pxpz1z47rharmdhppmqlpn7vaa455zligzr5sfcxa7zw9ih0mjv"))))
   (build-system cargo-build-system)
   (native-inputs
    (list bash-minimal m4))
   (arguments
    (list
     #:tests? #f
     #:rust (@@ (gnu packages rust) rust-1.65)
     #:phases
     '(modify-phases %standard-phases
		     (add-after 'configure 'delete-cargo-toml-orig
				(lambda _
				  (delete-file "Cargo.toml.orig")))
		     (add-after 'unpack 'set-shell-for-configure-script
				(lambda _
				  (setenv "CONFIG_SHELL" (which "sh")))))
     #:cargo-inputs `(("rust-libc" ,rust-libc-0.2)
		      ("rust-windows-sys" ,rust-windows-sys-0.42))))
   (home-page "https://gitlab.com/tspiteri/gmp-mpfr-sys")
   (synopsis "Rust FFI bindings for GMP, MPFR and MPC")
   (description "Rust FFI bindings for GMP, MPFR and MPC")
   (license license:lgpl3+)))

;; inherit
(define-public rust-rug-1
  (package
   (name "rust-rug")
   (version "1.19.2")
   (source
    (origin
     (method url-fetch)
     (uri (crate-uri "rug" version))
     (file-name (string-append name "-" version ".tar.gz"))
     (sha256
      (base32 "0d2smrq4x7g7l254qi4bsdn4ii6cav6qi749vck4a0rxfr28npjm"))))
   (build-system cargo-build-system)
   (arguments
    `(#:phases
      (modify-phases %standard-phases
		     (add-after 'unpack 'set-shell-for-configure-script
				(lambda _
				  (setenv "CONFIG_SHELL" (which "sh"))))
		     )

      #:cargo-inputs
      (("rust-az" ,rust-az-1)
       ("rust-gmp-mpfr-sys" ,rust-gmp-mpfr-sys-1)
       ("rust-gmp-mpfr-sys" ,rust-num-integer-0.1)
       ("rust-libc" ,rust-libc-0.2)
       ("rust-serde" ,rust-serde-1))
      #:cargo-development-inputs
      (("rust-bincode" ,rust-bincode-1)
       ("rust-byteorder" ,rust-byteorder-1)
       ("rust-serde-json" ,rust-serde-json-1)
       ("rust-serde-test" ,rust-serde-test-1))))
   (native-inputs
    (list bash-minimal m4))
   (home-page "https://gitlab.com/tspiteri/rug")
   (synopsis
    "Arbitrary-precision integers, rational, floating-point and complex numbers")
   (description "This is a Rust library of arbitrary-precision integers, rational,
floating-point, and complex numbers based on GMP, MPFR and MPC.")
   (license license:lgpl3+)))

;; inherit
(define-public rust-roxmltree-0.11
  (package
   (name "rust-roxmltree")
   (version "0.11.1")
   (source (origin
	    (method url-fetch)
	    (uri (crate-uri "roxmltree" version))
	    (file-name (string-append name "-" version ".tar.gz"))
	    (sha256
	     (base32
	      "035zz0s1y09qql3gi01gbjmlcfss9nqr2i91zmnsklkjiighfy02"))))
   (build-system cargo-build-system)
   (arguments
    `(#:skip-build? #t
      #:cargo-inputs (("rust-xmlparser" ,rust-xmlparser-0.13))))
   (home-page "https://github.com/RazrFalcon/roxmltree")
   (synopsis "Represent an XML as a read-only tree.")
   (description "Represent an XML as a read-only tree.")
   (license (list license:expat license:asl2.0))))

(define-public rust-ripemd160-0.8
  (package
    (name "rust-ripemd160")
    (version "0.8.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "ripemd160" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0jns4vb7p06pxxdrrqinwcn03qrm092l4v65zdxmg1xvvgh14ldd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-block-buffer" ,rust-block-buffer-0.7)
		       ("rust-digest" ,rust-digest-0.8)
		       ("rust-opaque-debug" ,rust-opaque-debug-0.2))))
    (home-page "https://github.com/RustCrypto/hashes")
    (synopsis "Deprecated. Use the ripemd crate isntead.")
    (description "Deprecated.  Use the ripemd crate isntead.")
    (license (list license:expat license:asl2.0))))

(define-public rust-ref-thread-local-0.0.0
  (package
    (name "rust-ref-thread-local")
    (version "0.0.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "ref_thread_local" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1rnvd1ka04c95s73kgwcp90g0i8bqaislg7lx944lxq05qmh44yq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/Xeiron/ref_thread_local.rs")
    (synopsis
     "A macro for declaring thread-local `static`s like using both of `lazy_static!` and `RefCell`")
    (description
     "This package provides a macro for declaring thread-local `static`s like using
both of `lazy_static!` and `RefCell`")
    (license license:expat)))

(define-public rust-phf-shared-0.9
  (package
    (name "rust-phf-shared")
    (version "0.9.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "phf_shared" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1ng0hi2byifqah6bcdy3zcpbwq8jxgl4laz65gq40dp3dm11i0x6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-siphasher" ,rust-siphasher-0.3)
		       ("rust-uncased" ,rust-uncased-0.9)
		       ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "Support code shared by PHF libraries")
    (description "Support code shared by PHF libraries")
    (license license:expat)))

(define-public rust-criterion-0.3
  (package
    (name "rust-criterion")
    (version "0.3.4")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "criterion" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"08rx789365x6l9kbsg2r9c5yg25rd3pj1giwyhpcqis56pbpwcmb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-async-std" ,rust-async-std-1)
		       ("rust-atty" ,rust-atty-0.2)
		       ("rust-cast" ,rust-cast-0.2)
		       ("rust-clap" ,rust-clap-2)
		       ("rust-criterion-plot" ,rust-criterion-plot-0.4)
		       ("rust-csv" ,rust-csv-1)
		       ("rust-futures" ,rust-futures-0.3)
		       ("rust-itertools" ,rust-itertools-0.10)
		       ("rust-lazy-static" ,rust-lazy-static-1)
		       ("rust-num-traits" ,rust-num-traits-0.2)
		       ("rust-oorandom" ,rust-oorandom-11.1)
		       ("rust-plotters" ,rust-plotters-0.3)
		       ("rust-rayon" ,rust-rayon-1)
		       ("rust-regex" ,rust-regex-1)
		       ("rust-serde" ,rust-serde-1)
		       ("rust-serde-cbor" ,rust-serde-cbor-0.11)
		       ("rust-serde-derive" ,rust-serde-derive-1)
		       ("rust-serde-json" ,rust-serde-json-1)
		       ("rust-smol" ,rust-smol-1)
		       ("rust-tinytemplate" ,rust-tinytemplate-1)
		       ("rust-tokio" ,rust-tokio-1)
		       ("rust-walkdir" ,rust-walkdir-2))))
    (home-page "https://bheisler.github.io/criterion.rs/book/index.html")
    (synopsis "Statistics-driven micro-benchmarking library")
    (description "Statistics-driven micro-benchmarking library")
    (license (list license:asl2.0 license:expat))))

(define-public rust-phf-generator-0.9
  (package
    (name "rust-phf-generator")
    (version "0.9.1")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "phf_generator" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"10ih96kaxnkn1yxk3ghpzgm09nc0rn69fd52kv68003fv4h34gyl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-criterion" ,rust-criterion-0.3)
		       ("rust-phf-shared" ,rust-phf-shared-0.9)
		       ("rust-rand" ,rust-rand-0.8))))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "PHF generation logic")
    (description "PHF generation logic")
    (license license:expat)))

(define-public rust-phf-macros-0.9
  (package
    (name "rust-phf-macros")
    (version "0.9.1")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "phf_macros" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1rpc0jy5sfrk3ir87k2q0kk44a45nsrbwc131jmsi6f8hi3fqi7g"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-phf-generator" ,rust-phf-generator-0.9)
		       ("rust-phf-shared" ,rust-phf-shared-0.9)
		       ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
		       ("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-syn" ,rust-syn-1)
		       ("rust-unicase" ,rust-unicase-2))))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "Macros to generate types in the phf crate")
    (description "Macros to generate types in the phf crate")
    (license license:expat)))

(define-public rust-phf-0.9
  (package
    (name "rust-phf")
    (version "0.9.1")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "phf" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0sk9arhiv4hkg3hbmbxnpjvr0bffhyz7kpb2pn86mn6ia4c566xj"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-phf-macros" ,rust-phf-macros-0.9)
		       ("rust-phf-shared" ,rust-phf-shared-0.9)
		       ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/rust-phf/rust-phf")
    (synopsis "Runtime support for perfect hash function data structures")
    (description "Runtime support for perfect hash function data structures")
    (license license:expat)))

(define-public rust-schemars-derive-0.6
  (package
    (name "rust-schemars-derive")
    (version "0.6.5")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "schemars_derive" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1a9h8bqqqd0i6605gyhz2jw2hi1wq1vfi262qrflkn3pyk75wlrq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-serde-derive-internals" ,rust-serde-derive-internals-0.25)
		       ("rust-syn" ,rust-syn-1))))
    (home-page "https://graham.cool/schemars/")
    (synopsis "Macros for #[derive(JsonSchema)], for use with schemars")
    (description "Macros for #[derive(JsonSchema)], for use with schemars")
    (license license:expat)))

(define-public rust-schemars-0.6
  (package
    (name "rust-schemars")
    (version "0.6.5")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "schemars" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1v6acgxkbhaw7fzg4mp09jv231f0mr224my629435wxasrrrfmh7"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.5)
		       ("rust-chrono" ,rust-chrono-0.4)
		       ("rust-either" ,rust-either-1)
		       ("rust-indexmap" ,rust-indexmap-1)
		       ("rust-schemars-derive" ,rust-schemars-derive-0.6)
		       ("rust-serde" ,rust-serde-1)
		       ("rust-serde-json" ,rust-serde-json-1)
		       ("rust-smallvec" ,rust-smallvec-1)
		       ("rust-uuid" ,rust-uuid-0.8))))
    (home-page "https://graham.cool/schemars/")
    (synopsis "Generate JSON Schemas from Rust code")
    (description "Generate JSON Schemas from Rust code")
    (license license:expat)))

(define-public rust-tinyvec-1
  (package
    (name "rust-tinyvec")
    (version "1.6.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "tinyvec" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0l6bl2h62a5m44jdnpn7lmj14rd44via8180i7121fvm73mmrk47"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
		       ("rust-serde" ,rust-serde-1)
		       ("rust-tinyvec-macros" ,rust-tinyvec-macros-0.1))))
    (home-page "https://github.com/Lokathor/tinyvec")
    (synopsis "`tinyvec` provides 100% safe vec-like data structures.")
    (description "`tinyvec` provides 100% safe vec-like data structures.")
    (license (list license:zlib license:asl2.0 license:expat))))

(define-public rust-rkyv-derive-0.7
  (package
    (name "rust-rkyv-derive")
    (version "0.7.41")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "rkyv_derive" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0rmn5n2ayrs19g5x2hkj02nkj0haj354a7wqj5i5ahgb60j6f75c"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/rkyv/rkyv")
    (synopsis "Derive macro for rkyv")
    (description "Derive macro for rkyv")
    (license license:expat)))

(define-public rust-rend-0.4
  (package
    (name "rust-rend")
    (version "0.4.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "rend" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1av8mfxrc6dvm0hmn2ymi56jrv6a7dqssxwdn1zx6h4j1790h42q"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytecheck" ,rust-bytecheck-0.6))))
    (home-page "https://github.com/djkoloski/rend")
    (synopsis "Endian-aware primitives for Rust")
    (description "Endian-aware primitives for Rust")
    (license license:expat)))

(define-public rust-quote-1
  (package
    (name "rust-quote")
    (version "1.0.26")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "quote" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1z521piwggwzs0rj4wjx4ma6af1g6f1h5dkp382y5akqyx5sy924"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1))))
    (home-page "https://github.com/dtolnay/quote")
    (synopsis "Quasi-quoting macro quote!(...)")
    (description "Quasi-quoting macro quote!(...)")
    (license (list license:expat license:asl2.0))))

(define-public rust-proc-macro2-1
  (package
    (name "rust-proc-macro2")
    (version "1.0.56")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "proc-macro2" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0ddlk2c7s9c0fhmf8cd0wikayicv9xrm9ck9vzgg9w86rnqbsqrb"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/proc-macro2")
    (synopsis
     "A substitute implementation of the compiler's `proc_macro` API to decouple token-based libraries from the procedural macro use case.")
    (description
     "This package provides a substitute implementation of the compiler's `proc_macro`
API to decouple token-based libraries from the procedural macro use case.")
    (license (list license:expat license:asl2.0))))

(define-public rust-syn-2
  (package
    (name "rust-syn")
    (version "2.0.14")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "syn" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1m9lmfk2h6a6pnj2im8bq753b11vkjizhdnh89vq9mkf6paidwzw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-unicode-ident" ,rust-unicode-ident-1))))
    (home-page "https://github.com/dtolnay/syn")
    (synopsis "Parser for Rust source code")
    (description "Parser for Rust source code")
    (license (list license:expat license:asl2.0))))

(define-public rust-uuid-macro-internal-1
  (package
    (name "rust-uuid-macro-internal")
    (version "1.3.1")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "uuid-macro-internal" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0dd2kjwv29r7a92siah6xqfi8jwg6k4wc815hkf0k4sf702sbs10"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-syn" ,rust-syn-2))))
    (home-page "")
    (synopsis "Private implementation details of the uuid! macro.")
    (description "Private implementation details of the uuid! macro.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-derive-arbitrary-1
  (package
    (name "rust-derive-arbitrary")
    (version "1.3.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "derive_arbitrary" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1dy8pmv7d8diqhbh1b88v8q5g0inwkgb465877jqimbjqjgfpkgk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/rust-fuzz/arbitrary")
    (synopsis "Derives arbitrary traits")
    (description "Derives arbitrary traits")
    (license (list license:expat license:asl2.0))))

(define-public rust-arbitrary-1
  (package
    (name "rust-arbitrary")
    (version "1.3.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "arbitrary" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0km5cj0sxfzv863blfjpz49mlikaxbaslyzk463i9jn1fgzril72"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-derive-arbitrary" ,rust-derive-arbitrary-1))))
    (home-page "https://github.com/rust-fuzz/arbitrary/")
    (synopsis
     "The trait for generating structured data from unstructured data")
    (description
     "The trait for generating structured data from unstructured data")
    (license (list license:expat license:asl2.0))))

(define-public rust-uuid-1
  (package
    (name "rust-uuid")
    (version "1.3.1")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "uuid" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1nwgjb3rzbr3gmjsqxhm118kq3c2304n8y781jhb7qx1ybza6mav"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
		       ("rust-atomic" ,rust-atomic-0.5)
		       ("rust-getrandom" ,rust-getrandom-0.2)
		       ("rust-md-5" ,rust-md-5-0.10)
		       ("rust-rand" ,rust-rand-0.8)
		       ("rust-serde" ,rust-serde-1)
		       ("rust-sha1-smol" ,rust-sha1-smol-1)
		       ("rust-slog" ,rust-slog-2)
		       ("rust-uuid-macro-internal" ,rust-uuid-macro-internal-1)
		       ("rust-wasm-bindgen" ,rust-wasm-bindgen-0.2)
		       ("rust-zerocopy" ,rust-zerocopy-0.6))))
    (home-page "https://github.com/uuid-rs/uuid")
    (synopsis "A library to generate and parse UUIDs.")
    (description
     "This package provides a library to generate and parse UUIDs.")
    (license (list license:asl2.0 license:expat))))

(define-public rust-bytecheck-derive-0.6
  (package
    (name "rust-bytecheck-derive")
    (version "0.6.10")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "bytecheck_derive" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1r9dlkx5w1p8d5gif2yvn6bz1856yij2fxi4wakq2vxl7ia2a4p3"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/djkoloski/bytecheck")
    (synopsis "Derive macro for bytecheck")
    (description "Derive macro for bytecheck")
    (license license:expat)))

(define-public rust-bytecheck-0.6
  (package
    (name "rust-bytecheck")
    (version "0.6.10")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "bytecheck" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"07vxs7y441f7d6mjzmli80ykmfajwk9jqci549b29sr319j13zhk"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-bytecheck-derive" ,rust-bytecheck-derive-0.6)
		       ("rust-ptr-meta" ,rust-ptr-meta-0.1)
		       ("rust-simdutf8" ,rust-simdutf8-0.1)
		       ("rust-uuid" ,rust-uuid-1))))
    (home-page "https://github.com/djkoloski/bytecheck")
    (synopsis "Derive macro for bytecheck")
    (description "Derive macro for bytecheck")
    (license license:expat)))

(define-public rust-wyz-0.5
  (package
    (name "rust-wyz")
    (version "0.5.1")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "wyz" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1vdrfy7i2bznnzjdl9vvrzljvs4s3qm8bnlgqwln6a941gy61wq5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-once-cell" ,rust-once-cell-1)
		       ("rust-tap" ,rust-tap-1)
		       ("rust-typemap" ,rust-typemap-0.3))))
    (home-page "https://myrrlyn.net/crates/wyz")
    (synopsis "myrrlynâs utility collection")
    (description "myrrlynâs utility collection")
    (license license:expat)))

(define-public rust-radium-0.7
  (package
    (name "rust-radium")
    (version "0.7.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "radium" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"02cxfi3ky3c4yhyqx9axqwhyaca804ws46nn4gc1imbk94nzycyw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://ferrilab.github.io/ferrilab")
    (synopsis "Portable interfaces for maybe-atomic types")
    (description "Portable interfaces for maybe-atomic types")
    (license license:expat)))

(define-public rust-funty-2
  (package
    (name "rust-funty")
    (version "2.0.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "funty" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"177w048bm0046qlzvp33ag3ghqkqw4ncpzcm5lq36gxf2lla7mg6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://ferrilab.github.io/ferrilab")
    (synopsis "Trait generalization over the primitive types")
    (description "Trait generalization over the primitive types")
    (license license:expat)))

(define-public rust-bitvec-1
  (package
    (name "rust-bitvec")
    (version "1.0.1")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "bitvec" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"173ydyj2q5vwj88k6xgjnfsshs4x9wbvjjv7sm0h36r34hn87hhv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-funty" ,rust-funty-2)
		       ("rust-radium" ,rust-radium-0.7)
		       ("rust-serde" ,rust-serde-1)
		       ("rust-tap" ,rust-tap-1)
		       ("rust-wyz" ,rust-wyz-0.5))))
    (home-page "https://bitvecto-rs.github.io/bitvec")
    (synopsis "Addresses memory by bits, for packed collections and bitfields")
    (description
     "Addresses memory by bits, for packed collections and bitfields")
    (license license:expat)))

(define-public rust-rkyv-0.7
  (package
    (name "rust-rkyv")
    (version "0.7.41")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "rkyv" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0gps7i69lpjjhkcnf601i2fmw8y0rjran2l8h7h7mw0733crwj91"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arrayvec" ,rust-arrayvec-0.7)
		       ("rust-bitvec" ,rust-bitvec-1)
		       ("rust-bytecheck" ,rust-bytecheck-0.6)
		       ("rust-hashbrown" ,rust-hashbrown-0.12)
		       ("rust-indexmap" ,rust-indexmap-1)
		       ("rust-ptr-meta" ,rust-ptr-meta-0.1)
		       ("rust-rend" ,rust-rend-0.4)
		       ("rust-rkyv-derive" ,rust-rkyv-derive-0.7)
		       ("rust-seahash" ,rust-seahash-4)
		       ("rust-smallvec" ,rust-smallvec-1)
		       ("rust-tinyvec" ,rust-tinyvec-1)
		       ("rust-uuid" ,rust-uuid-1))))
    (home-page "https://github.com/rkyv/rkyv")
    (synopsis "Zero-copy deserialization framework for Rust")
    (description "Zero-copy deserialization framework for Rust")
    (license license:expat)))

(define-public rust-ordered-float-2
  (package
    (name "rust-ordered-float")
    (version "2.10.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "ordered-float" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"11qdskfgk911bs541avzkrfahq6arnb2bkvzs0c36na2m4ncyh3r"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-arbitrary" ,rust-arbitrary-1)
		       ("rust-num-traits" ,rust-num-traits-0.2)
		       ("rust-proptest" ,rust-proptest-1)
		       ("rust-rand" ,rust-rand-0.8)
		       ("rust-rkyv" ,rust-rkyv-0.7)
		       ("rust-schemars" ,rust-schemars-0.6)
		       ("rust-serde" ,rust-serde-1))))
    (home-page "https://github.com/reem/rust-ordered-float")
    (synopsis "Wrappers for total ordering on floats")
    (description "Wrappers for total ordering on floats")
    (license license:expat)))

(define-public rust-modular-bitfield-impl-0.11
  (package
    (name "rust-modular-bitfield-impl")
    (version "0.11.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "modular-bitfield-impl" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"12dpljzpnx5yfmlk9amb2cm0c6ikxi8adiidvrlbqgk0frq5yzas"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/robbepop/modular-bitfield")
    (synopsis "Bitfields for structs that allow for modular use of enums.")
    (description "Bitfields for structs that allow for modular use of enums.")
    (license (list license:expat license:asl2.0))))

(define-public rust-modular-bitfield-0.11
  (package
    (name "rust-modular-bitfield")
    (version "0.11.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "modular-bitfield" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0x4aygjbv3xdyiywwwkgcbafjyqzya0x5fdkkr7irb04hfx7jgd5"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-modular-bitfield-impl" ,rust-modular-bitfield-impl-0.11)
		       ("rust-static-assertions" ,rust-static-assertions-1))))
    (home-page "https://github.com/robbepop/modular-bitfield")
    (synopsis
     "Allows to easily define bitfield types with modular building blocks.")
    (description
     "Allows to easily define bitfield types with modular building blocks.")
    (license (list license:expat license:asl2.0))))

(define-public rust-divrem-0.1
  (package
    (name "rust-divrem")
    (version "0.1.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "divrem" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1ff0vqmr0rmwmxr3is6vn09ad6ldzyxkc9g8zsyr365rvha8k7xw"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/letheed/divrem")
    (synopsis "Division and modulus variants")
    (description "Division and modulus variants")
    (license license:expat)))

(define-public rust-windows-x86-64-msvc-0.42
  (package
    (name "rust-windows-x86-64-msvc")
    (version "0.42.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows_x86_64_msvc" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1w5r0q0yzx827d10dpjza2ww0j8iajqhmb54s735hhaj66imvv4s"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnullvm-0.42
  (package
    (name "rust-windows-x86-64-gnullvm")
    (version "0.42.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows_x86_64_gnullvm" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"18wl9r8qbsl475j39zvawlidp1bsbinliwfymr43fibdld31pm16"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-x86-64-gnu-0.42
  (package
    (name "rust-windows-x86-64-gnu")
    (version "0.42.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows_x86_64_gnu" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0dnbf2xnp3xrvy8v9mgs3var4zq9v9yh9kv79035rdgyp2w15scd"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-msvc-0.42
  (package
    (name "rust-windows-i686-msvc")
    (version "0.42.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows_i686_msvc" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0q0h9m2aq1pygc199pa5jgc952qhcnf0zn688454i7v4xjv41n24"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-i686-gnu-0.42
  (package
    (name "rust-windows-i686-gnu")
    (version "0.42.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows_i686_gnu" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0kx866dfrby88lqs9v1vgmrkk1z6af9lhaghh5maj7d4imyr47f6"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-msvc-0.42
  (package
    (name "rust-windows-aarch64-msvc")
    (version "0.42.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows_aarch64_msvc" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0hsdikjl5sa1fva5qskpwlxzpc5q9l909fpl1w6yy1hglrj8i3p0"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-aarch64-gnullvm-0.42
  (package
    (name "rust-windows-aarch64-gnullvm")
    (version "0.42.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows_aarch64_gnullvm" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1y4q0qmvl0lvp7syxvfykafvmwal5hrjb4fmv04bqs0bawc52yjr"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import lib for Windows")
    (description "Import lib for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-targets-0.42
  (package
    (name "rust-windows-targets")
    (version "0.42.2")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows-targets" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0wfhnib2fisxlx8c507dbmh97kgij4r6kcxdi0f9nk6l1k080lcf"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-aarch64-gnullvm" ,rust-windows-aarch64-gnullvm-0.42)
		       ("rust-windows-aarch64-msvc" ,rust-windows-aarch64-msvc-0.42)
		       ("rust-windows-i686-gnu" ,rust-windows-i686-gnu-0.42)
		       ("rust-windows-i686-msvc" ,rust-windows-i686-msvc-0.42)
		       ("rust-windows-x86-64-gnu" ,rust-windows-x86-64-gnu-0.42)
		       ("rust-windows-x86-64-gnullvm" ,rust-windows-x86-64-gnullvm-0.42)
		       ("rust-windows-x86-64-msvc" ,rust-windows-x86-64-msvc-0.42))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Import libs for Windows")
    (description "Import libs for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-windows-sys-0.45
  (package
    (name "rust-windows-sys")
    (version "0.45.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "windows-sys" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1l36bcqm4g89pknfp8r9rl1w4bn017q6a8qlx8viv0xjxzjkna3m"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-windows-targets" ,rust-windows-targets-0.42))))
    (home-page "https://github.com/microsoft/windows-rs")
    (synopsis "Rust for Windows")
    (description "Rust for Windows")
    (license (list license:expat license:asl2.0))))

(define-public rust-ctrlc-3
  (package
    (name "rust-ctrlc")
    (version "3.2.5")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "ctrlc" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"0fgng4k7d3bx2q86z2djkngwss43wkrfkriswhgf9jqqlv137kxv"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-nix" ,rust-nix-0.26)
		       ("rust-windows-sys" ,rust-windows-sys-0.45))))
    (home-page "https://github.com/Detegr/rust-ctrlc")
    (synopsis "Easy Ctrl-C handler for Rust projects")
    (description "Easy Ctrl-C handler for Rust projects")
    (license (list license:expat license:asl2.0))))

(define-public rust-sha2-0.10
  (package
    (name "rust-sha2")
    (version "0.10.6")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "sha2" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1h5xrrv2y06kr1gsz4pwrm3lsp206nm2gjxgbf21wfrfzsavgrl2"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-cfg-if" ,rust-cfg-if-1)
		       ("rust-cpufeatures" ,rust-cpufeatures-0.2)
		       ("rust-digest" ,rust-digest-0.10)
		       ("rust-sha2-asm" ,rust-sha2-asm-0.6))))
    (home-page "https://github.com/RustCrypto/hashes")
    (synopsis "Pure Rust implementation of the SHA-2 hash function family
including SHA-224, SHA-256, SHA-384, and SHA-512.
")
    (description
     "Pure Rust implementation of the SHA-2 hash function family including SHA-224,
SHA-256, SHA-384, and SHA-512.")
    (license (list license:expat license:asl2.0))))

(define-public rust-blake2-0.10
  (package
    (name "rust-blake2")
    (version "0.10.6")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "blake2" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1zlf7w7gql12v61d9jcbbswa3dw8qxsjglylsiljp9f9b3a2ll26"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-digest" ,rust-digest-0.10))))
    (home-page "https://github.com/RustCrypto/hashes")
    (synopsis "BLAKE2 hash functions")
    (description "BLAKE2 hash functions")
    (license (list license:expat license:asl2.0))))

(define-public rust-crrl-0.2
  (package
    (name "rust-crrl")
    (version "0.2.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "crrl" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1h9fnh6ad0wims4h5js86hfjvy3xd110xw41h971x406ln90id1d"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-blake2" ,rust-blake2-0.10)
		       ("rust-rand-core" ,rust-rand-core-0.6)
		       ("rust-sha2" ,rust-sha2-0.10))))
    (home-page "https://github.com/pornin/crrl")
    (synopsis "Library for cryptographic research")
    (description "Library for cryptographic research")
    (license license:expat)))

(define-public rust-cpu-time-1
  (package
    (name "rust-cpu-time")
    (version "1.0.0")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "cpu-time" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1vbxidyahd3vc91qz1ny9q5h10qqg1nbi1ah0z9zmqcgcskr7qz9"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs (("rust-libc" ,rust-libc-0.2)
		       ("rust-winapi" ,rust-winapi-0.3))))
    (home-page "https://github.com/tailhook/cpu-time")
    (synopsis "    Small crate that provides CPU time measurement.
")
    (description "Small crate that provides CPU time measurement.")
    (license (list license:expat license:asl2.0))))

(define-public scryer-prolog-0.9
  (package
    (name "scryer-prolog")
    (version "0.9.1")
    (source (origin
	      (method url-fetch)
	      (uri (crate-uri "scryer-prolog" version))
	      (file-name (string-append name "-" version ".tar.gz"))
	      (sha256
	       (base32
		"1h2p76zgjx2fpmm29xw31px5354w41d3r2wspf34i90rixc1by4w"))))
    (native-inputs
     (list pkg-config bash-minimal m4))
    (inputs
     (list openssl))
    (build-system cargo-build-system)
    (arguments
     (list
      #:tests? #f                  ;doc test fails
      #:phases
      '(modify-phases %standard-phases
	(add-after 'unpack 'set-shell-for-configure-script
	  (lambda _
	    (setenv "CONFIG_SHELL" (which "sh"))))
	 (add-after 'configure 'delete-cargo-toml-orig
	   (lambda _
	     (when (file-exists? "Cargo.toml.orig")
	       (delete-file "Cargo.toml.orig")))))
      #:rust (@@ (gnu packages rust) rust-1.65)
      #:cargo-inputs `(("rust-lock-api" ,rust-lock-api-0.4.6)
		       ("rust-crypto-common" ,rust-crypto-common-0.1.3)
		       ("rust-typenum" ,rust-typenum-1.14.0)
		       ;; Above is our version
		       ("rust-base64" ,rust-base64-0.12)
		       ("rust-blake2" ,rust-blake2-0.8)
		       ("rust-chrono" ,rust-chrono-0.4)
		       ("rust-cpu-time" ,rust-cpu-time-1)
		       ("rust-crossterm" ,rust-crossterm-0.20)
		       ("rust-crrl" ,rust-crrl-0.2)
		       ("rust-ctrlc" ,rust-ctrlc-3)
		       ("rust-dirs-next" ,rust-dirs-next-2)
		       ("rust-divrem" ,rust-divrem-0.1)
		       ("rust-futures" ,rust-futures-0.3)
		       ("rust-fxhash" ,rust-fxhash-0.2)
		       ("rust-git-version" ,rust-git-version-0.3)
		       ("rust-hostname" ,rust-hostname-0.3)
		       ("rust-hyper" ,rust-hyper-0.14)
		       ("rust-hyper-tls" ,rust-hyper-tls-0.5)
		       ("rust-indexmap" ,rust-indexmap-1)
		       ("rust-indexmap" ,rust-indexmap-1)
		       ("rust-lazy-static" ,rust-lazy-static-1)
		       ("rust-lexical" ,rust-lexical-5)
		       ("rust-libc" ,rust-libc-0.2)
		       ("rust-modular-bitfield" ,rust-modular-bitfield-0.11)
		       ("rust-native-tls" ,rust-native-tls-0.2)
		       ("rust-ordered-float" ,rust-ordered-float-2)
		       ("rust-phf" ,rust-phf-0.9)
		       ("rust-proc-macro2" ,rust-proc-macro2-1)
		       ("rust-quote" ,rust-quote-1)
		       ("rust-ref-thread-local" ,rust-ref-thread-local-0.0.0)
		       ("rust-ring" ,rust-ring-0.16)
		       ("rust-ripemd160" ,rust-ripemd160-0.8)
		       ("rust-roxmltree" ,rust-roxmltree-0.11)
		       ("rust-rug" ,rust-rug-1)
		       ("rust-rustyline" ,rust-rustyline-9)
		       ("rust-ryu" ,rust-ryu-1)
		       ("rust-select" ,rust-select-0.4)
		       ("rust-sha3" ,rust-sha3-0.8)
		       ("rust-smallvec" ,rust-smallvec-1)
		       ("rust-sodiumoxide" ,rust-sodiumoxide-0.2)
		       ("rust-static-assertions" ,rust-static-assertions-1)
		       ("rust-strum" ,rust-strum-0.23)
		       ("rust-strum-macros" ,rust-strum-macros-0.23)
		       ("rust-syn" ,rust-syn-1)
		       ("rust-to-syn-value" ,rust-to-syn-value-0.1)
		       ("rust-to-syn-value-derive" ,rust-to-syn-value-derive-0.1)
		       ("rust-tokio" ,rust-tokio-1)
		       ("rust-walkdir" ,rust-walkdir-2))
       #:cargo-development-inputs `(("rust-assert-cmd" ,rust-assert-cmd-1)
				   ("rust-predicates-core" ,rust-predicates-core-1.0.6)
				   ("rust-serial-test" ,rust-serial-test-0.5))))
    (home-page "https://github.com/mthom/scryer-prolog")
    (synopsis "A modern Prolog implementation written mostly in Rust.")
    (description
     "This package provides a modern Prolog implementation written mostly in Rust.")
    (license license:bsd-3)))

;; TODO: modular bitfield, need to fetch from mthom
(define-public scryer-prolog-next
  (let ((commit "fc7d98d7488c1538c96b4a1c734be653786209c3")
	(revision "1"))
    (package
      (inherit scryer-prolog-0.9)
      (name "scryer-prolog-next")
      (version (git-version "0.9.1" revision commit))
      (source (origin
		(method git-fetch)
		(uri (git-reference
		      (url "https://github.com/mthom/scryer-prolog")
		      (commit commit)))
		(file-name (git-file-name name version))
		(sha256
		 (base32
		  "036l4wwlzqjznyz76wfrfcll17z3m3lgffixxqmb6ybn6qgi8n68")))))))
