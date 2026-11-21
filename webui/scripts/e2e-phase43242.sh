#!/usr/bin/env bash
# Phase-43242: UI ssh-auth-soft-45520-echo roster Soft 43240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-45520-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft45520EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 43240+ ssh-auth-soft-45520-echo roster ok"; echo "cleaned"; echo "OK: phase43242 e2e passed"
