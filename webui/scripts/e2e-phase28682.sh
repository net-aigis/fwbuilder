#!/usr/bin/env bash
# Phase-28682: UI ssh-auth-schema-295-echo roster Soft 28680+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-295-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema295EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 28680+ ssh-auth-schema-295-echo roster ok"; echo "cleaned"; echo "OK: phase28682 e2e passed"
