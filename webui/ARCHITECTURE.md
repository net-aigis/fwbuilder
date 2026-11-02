# Firewall Builder WebUI — Architecture

Status document companion: [`STATUS.md`](STATUS.md).

## Goal

Provide a browser UI that edits the **same** `.fwb` projects as the desktop GUI
by reusing **libfwbuilder** and the existing compiler binaries. No second
compiler or object model.

## Layers

```
Browser (React SPA)
        |  REST + WebSocket
FastAPI backend (auth, sessions, locks, process manager)
        |  JSON Lines over stdin/stdout
fwbweb bridge (C++, links libfwbuilder + libcommon)
        |
FWObjectDatabase  ↔  .fwb XML (unchanged DTD / format)
        |
existing fwb_* compilers (subprocess, later phase)
```

### Why this split

- **libfwbuilder** remains the only authority for load/save/mutate.
- The bridge is a thin JSON façade over `FWObjectDatabase` (same library
  `fwbedit` and the GUI use).
- FastAPI owns multi-user concerns the C++ core never had: tokens, advisory
  file locks, WebSocket fan-out, sandboxing of compiler/deploy later.
- The React SPA mirrors the desktop layout (tree left, editor main) without
  embedding Qt.

## Session model

1. Client authenticates (`FWBWEB_API_TOKEN` bearer for Phase 1).
2. `POST /api/v1/projects/open` copies or opens a path under a workspace,
   takes an exclusive advisory lock, starts one `fwbweb` process.
3. Reads/writes go through that process for the session lifetime.
4. `POST .../save` calls `FWObjectDatabase::saveFile`.
5. `POST .../close` stops the bridge and releases the lock.

Concurrent writers on the same path are rejected while the lock is held.

## What must not change

- Compiler behaviour / rule semantics
- `.fwb` XML schema beyond what libfwbuilder already migrates
- Desktop GUI code paths (except optional shared helpers later, if unavoidable)

## Dependencies (justified)

| Piece | Why |
| --- | --- |
| Qt Core (existing) | Already required by `libcommon` / libfwbuilder tooling |
| FastAPI + uvicorn | Thin HTTP/WebSocket front without reimplementing auth in C++ |
| React + Vite | Modern SPA; no Qt-in-browser |
| No second XML object model in Python/TS | All mutations via `fwbweb` |

## Build

1. Build FWB as usual (`./autogen.sh && make`) so `src/fwbweb/fwbweb` exists.
2. `webui/backend`: `pip install -e '.[dev]'`
3. `webui/frontend`: `npm ci && npm run build`

CI job `fwbuilder-webui` builds the bridge (Linux Qt6 tree), runs API unit
tests (bridge mocked when binary absent; integration when present), and
frontend typecheck/build.
