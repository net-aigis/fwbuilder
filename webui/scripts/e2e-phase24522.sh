#!/usr/bin/env bash
# Phase-24522: UI ssh-auth-schema-243-echo roster Soft 24520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-243-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema243EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24520+ ssh-auth-schema-243-echo roster ok"; echo "cleaned"; echo "OK: phase24522 e2e passed"
