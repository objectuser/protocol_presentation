# ProtocolPresentation

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `protocol_presentation` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:protocol_presentation, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/protocol_presentation>.


# Background

It's common for Elixir applications to use `@behaviour`s for varying application
behavior per environment.

Quinn Wilton talked about using protocols instead of (or in addition to)
behaviour's here: https://www.youtube.com/watch?v=fhheJ5zsXBQ

We had a short Twitter conversation about the configuration aspect here:
https://twitter.com/objectuser/status/1556048197985845248

# Protocols vs Behaviours

How is a protocol-focused implemenation different from a behaviour focused
implementation?

After providing some background on abstract data types and the Liskov
subsitution principle, Quinn uses an example of a test implementation that
carries state:
- the behaviour implemenation either needs to change the interface or use mocks
- the protocol implemenation keeps the same interface and opens up some options

The key issues are:
- behaviours are inflexible with respect to interface in that it's hard to
  reference state
- global state prevents concurrent operation in tests or multiple implemenations
  in the application

Protocols provide polymorphism based on a struct instead of atoms. This has a
few advantages:
- the use of the protocol module is recognized by the compiler and other tooling
    - eg docs are available in VSCode
    - compare this to the typical `Application.get_env/3` that returns an atom
    with no accompanying information
- structs may carry state
    - eg tests using state can run async and not interfere with each other

