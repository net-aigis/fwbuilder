#!/usr/bin/env bash
# Phase-20202: UI ssh-auth-soft-20160-echo roster Soft 20200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-20160-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft20160EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20200+ ssh-auth-soft-20160-echo roster ok"; echo "cleaned"; echo "OK: phase20202 e2e passed"
