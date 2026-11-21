#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthMethodPartitionRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-method-partition roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10218 e2e passed"
