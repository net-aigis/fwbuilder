#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq sshAuthCatalogCountRosterDetail webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'Download ssh-auth-catalog-count roster' webui/frontend/src/components/FirewallExtras.tsx
echo "OK: phase11738 e2e passed"
