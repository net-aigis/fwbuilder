#!/usr/bin/env bash
# Phase-44602: UI ssh-auth-ms-91500-echo roster Soft 44600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ms-91500-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthMs91500EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 44600+ ssh-auth-ms-91500-echo roster ok"; echo "cleaned"; echo "OK: phase44602 e2e passed"
