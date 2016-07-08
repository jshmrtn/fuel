#!/bin/bash
shopt -s nullglob

GLOBIGNORE="*.example"
ENVIRONMENTS=( hosts/* )
ENVIRONMENTS=( "${ENVIRONMENTS[@]##*/}" )
NUM_ARGS=1

show_usage() {
  echo "
    Usage:
      ./fuel.sh deploy <environment>
      ./fuel.sh db <environment> <action>
      ./fuel.sh uploads <environment> <action>

      <environment> is the environment to deploy to ("staging", "production", etc)
      <action> is the database action ("push", "pull")

    Available environments:
      `( IFS=$' '; echo "${ENVIRONMENTS[*]}" )`

    Examples:
      ./fuel.sh deploy staging
      ./fuel.sh uploads staing push
      ./fuel.sh uploads production pull
      ./fuel.sh db staging push
      ./fuel.sh db production pull
    "
}

[[ $# -ne $NUM_ARGS && $1 != deploy && $1 != db && $1 != uploads ]] && { show_usage; exit 0; }

if [[ $1 = deploy ]]; then

  DEPLOY_CMD="ansible-playbook -i hosts/$2 deploy.yml"
  ENVIRONMENTS=( hosts/* )
  ENVIRONMENTS=( "${ENVIRONMENTS[@]##*/}" )
  NUM_ARGS=2

  show_usage() {
    echo "
      Usage:
        ./fuel.sh deploy <environment>

        <environment> is the environment to deploy to ("staging", "production", etc)

      Available environments:
        `( IFS=$' '; echo "${ENVIRONMENTS[*]}" )`

      Examples:
        ./fuel.sh deploy staging
        ./fuel.sh deploy production
      "
  }

  HOSTS_FILE="hosts/$2"

  [[ $# -ne $NUM_ARGS || $2 = -h ]] && { show_usage; exit 0; }

  if [[ ! -e $HOSTS_FILE ]]; then
    echo "Error: $2 is not a valid environment ($HOSTS_FILE does not exist)."
    echo
    echo "Available environments:"
    ( IFS=$'\n'; echo "${ENVIRONMENTS[*]}" )
    exit 0
  fi

  $DEPLOY_CMD

fi

if [[ $1 = db ]]; then

  DEPLOY_CMD="ansible-playbook -i hosts/$2 db_$3.yml"
  ENVIRONMENTS=( hosts/* )
  ENVIRONMENTS=( "${ENVIRONMENTS[@]##*/}" )
  NUM_ARGS=3

  show_usage() {
    echo "
      Usage:
        ./fuel.sh db <environment> <action>

        <environment> is the environment to deploy to ("staging", "production", etc)
        <action> is the database action ("push", "pull")

      Available environments:
        `( IFS=$' '; echo "${ENVIRONMENTS[*]}" )`

      Examples:
        ./fuel.sh db staging push
        ./fuel.sh db production pull
      "
  }

  HOSTS_FILE="hosts/$2"

  [[ $# -ne $NUM_ARGS || $2 = -h ]] && { show_usage; exit 0; }

  if [[ ! -e $HOSTS_FILE ]]; then
    echo "Error: $2 is not a valid environment ($HOSTS_FILE does not exist)."
    echo
    echo "Available environments:"
    ( IFS=$'\n'; echo "${ENVIRONMENTS[*]}" )
    exit 0
  fi

  $DEPLOY_CMD

fi

if [[ $1 = uploads ]]; then

  DEPLOY_CMD="ansible-playbook -i hosts/$2 uploads_$3.yml"
  ENVIRONMENTS=( hosts/* )
  ENVIRONMENTS=( "${ENVIRONMENTS[@]##*/}" )
  NUM_ARGS=3

  show_usage() {
    echo "
      Usage:
        ./fuel.sh uploads <environment> <action>

        <environment> is the environment to deploy to ("staging", "production", etc)
        <action> is the database action ("push", "pull")

      Available environments:
        `( IFS=$' '; echo "${ENVIRONMENTS[*]}" )`

      Examples:
        ./fuel.sh uploads staging push
        ./fuel.sh uploads production pull
  "
  }

  HOSTS_FILE="hosts/$2"

  [[ $# -ne $NUM_ARGS || $2 = -h ]] && { show_usage; exit 0; }

  if [[ ! -e $HOSTS_FILE ]]; then
    echo "Error: $2 is not a valid environment ($HOSTS_FILE does not exist)."
    echo
    echo "Available environments:"
    ( IFS=$'\n'; echo "${ENVIRONMENTS[*]}" )
    exit 0
  fi

  $DEPLOY_CMD

fi
