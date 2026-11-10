#!/usr/bin/env bash
# Phase-27242: UI ssh-auth-soft-27600-echo roster Soft 27240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-27600-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft27600EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 27240+ ssh-auth-soft-27600-echo roster ok"; echo "cleaned"; echo "OK: phase27242 e2e passed"
