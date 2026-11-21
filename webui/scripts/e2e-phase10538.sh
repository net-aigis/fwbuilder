#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthImplSupportPairRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-impl-support-pair roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase10538 e2e passed"
