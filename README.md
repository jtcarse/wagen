# wagen
## WeakAura Generator

Command-line tool and lib functions to generate weakauras from opinionated templates.
Run with `lua main.lua`.

Not intended to be incredibly modular; intended to allow me to quickly create weakauras according to my own specifications. The templates themselves are just weakauras I made.

I stole the methods in `IO.lua` from [WeakAuras2](https://github.com/WeakAuras/WeakAuras2), and ripped [LibDeflate](https://github.com/SafeteeWoW/LibDeflate) and [LibSerialize](https://github.com/rossnichols/LibSerialize) from their respective GitHub pages. I needed all three of those things to map import strings to lua tables and back, which I needed to be able to do so that I can generate and import weakauras.
