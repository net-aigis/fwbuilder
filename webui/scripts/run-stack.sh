#!/usr/bin/env bash
# Start WebUI API (+ optional Vite frontend) for local product use.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

export FWBWEB_BRIDGE="${FWBWEB_BRIDGE:-$ROOT/webui/bin/fwbweb}"
export FWBWEB_API_TOKEN="${FWBWEB_API_TOKEN:-dev-token}"
export FWBWEB_API_USER="${FWBWEB_API_USER:-admin}"
export FWBWEB_WORKSPACE="${FWBWEB_WORKSPACE:-$ROOT/webui/.workspace}"
export FWBUILDER_RES_DIR="${FWBUILDER_RES_DIR:-$ROOT/webui/.res}"
export FWBWEB_CORS_ORIGINS="${FWBWEB_CORS_ORIGINS:-http://127.0.0.1:5173,http://localhost:5173}"
API_PORT="${FWBWEB_API_PORT:-8088}"
WITH_FRONTEND="${FWBWEB_WITH_FRONTEND:-1}"

mkdir -p "$FWBWEB_WORKSPACE"

# Smoke the bridge before binding the API.
echo '{"cmd":"ping"}' | "$FWBWEB_BRIDGE" >/dev/null

BACKEND="$ROOT/webui/backend"
if [[ ! -x "$BACKEND/.venv/bin/uvicorn" ]]; then
  python3 -m venv "$BACKEND/.venv"
  "$BACKEND/.venv/bin/pip" install -e "$BACKEND[dev]"
fi

cleanup() {
  [[ -n "${FRONT_PID:-}" ]] && kill "$FRONT_PID" 2>/dev/null || true
}
trap cleanup EXIT

if [[ "$WITH_FRONTEND" == "1" ]]; then
  (
    cd "$ROOT/webui/frontend"
    if [[ ! -d node_modules ]]; then
      npm install
    fi
    npm run dev -- --host 127.0.0.1 --port 5173
  ) &
  FRONT_PID=$!
fi

echo "API  http://127.0.0.1:${API_PORT}  (Bearer ${FWBWEB_API_TOKEN})"
echo "UI   http://127.0.0.1:5173"
echo "Multi-user: set FWBWEB_API_USERS='alice:tok-a,bob:tok-b' or FWBWEB_API_USERS_FILE"

cd "$BACKEND"
exec .venv/bin/uvicorn fwbweb_api.main:app --host 127.0.0.1 --port "$API_PORT"
