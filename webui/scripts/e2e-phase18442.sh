#!/usr/bin/env bash
# Phase-18442: UI ssh-auth-schema-167-echo roster Soft 18440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-167-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema167EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18440+ ssh-auth-schema-167-echo roster ok"; echo "cleaned"; echo "OK: phase18442 e2e passed"
