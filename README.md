# ProtocolPresentation

A description with sample code of using protocols instead of behaviours for
interfaces to external systems.

# Background

It's common for Elixir applications to use `@behaviour`s for varying application
behavior per environment.

Quinn Wilton talked about using protocols instead of (or in addition to)
behaviour's here: https://www.youtube.com/watch?v=fhheJ5zsXBQ

We had a short Twitter conversation about the configuration aspect here:
https://twitter.com/objectuser/status/1556048197985845248

# Protocols vs Behaviours

How is a protocol-focused implementation different from a behaviour focused
implementation?

After providing some background on abstract data types and the Liskov
subsitution principle, Quinn uses an example of a test implementation that
carries state:
- the behaviour implementation either needs to change the interface or use mocks
- the protocol implementation keeps the same interface and opens up some options

The key issues are:
- behaviours are inflexible with respect to interface in that it's hard to
  control scope
- global state prevents concurrent operation in tests or multiple
  implementations in the application

Protocols provide polymorphism based on a struct instead of atoms. This has a
few advantages:
- the use of the protocol module is recognized by the compiler and other tooling
    - eg function names are checked and docs are available in VSCode
    - compare this to the typical `Application.get_env/3` that returns an atom
      with no accompanying information
    - note that structs may only be created in `runtime.exs`, not the compile
      time configs, while atoms (behaviours) may be defined anywhere
- structs may carry state
    - eg tests using state can run async and not interfere with each other

Limitations:
- You still don't get compile-time checking that the argument has an
implementation for the protocol.
- You may still need to configure the struct, and that means using `runtime.exs`

Takeaways:
- use protocols for polymorphism and leverage the struct for state, config, etc.
- use behaviours for implementing module-based abstractions like GenServers
