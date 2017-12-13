SQL_FILE_DIR=${BASH_SOURCE%/*}/../sql
SECRET_FILE=~/.mypostgresqlconf

if [[ ! -e ${SECRET_FILE} ]] ; then echo "${SECRET_FILE} existiert nicht"; exit 1; fi
if [[ ! -r ${SECRET_FILE} ]] ; then echo "${SECRET_FILE} ist nicht lesbar"; exit 1; fi
if [[   -L ${SECRET_FILE} ]] ; then echo "${SECRET_FILE} ist ein symbolischer Link"; exit 1; fi
if [[  $(stat -f "%p" ${SECRET_FILE} | cut  -c 4-7) != "600" ]] ; then echo "${SECRET_FILE} muß das Berechtiungsschema 600 haben."; exit 1; fi

function su-sql {
    local file=$1

    internal-sql ${PGSU} ${PGSUPW} ${file}
}

function sql {
    local file=$1
    
    internal-sql ${PGU} ${PGPW} ${file}
}

function internal-sql {
    local effectiveuser=$1
    local effectivepw=$2
    local file=$3

    if [[ ${file:(-4)} != ".sql" ]] ; then file="${file}.sql"; fi

    local ffile="${SQL_FILE_DIR}/${file}"

    if [[ ! -e ${ffile} ]]; then echo "Datei ${ffile} existiert nicht."; exit 1; fi
    if [[ ! -r ${ffile} ]]; then echo "Datei ${ffile} ist nicht lesbar."; exit 1; fi

    PGPASSWORD="${effectivepw}" psql -w --host=${PGH} --port=${PGP} --username=${effectiveuser} \
              --dbname=postgres --file=${ffile}
}

function not-empty {
    local varname=$1

    if [[ -z ${!varname} ]]; then echo "Variable ${varname} ist nicht gesetzt."; exit 1; fi
}

source ${SECRET_FILE}

not-empty PGSU
not-empty PGSUPW
not-empty PGU
not-empty PGPW
not-empty PGH
not-empty PGP
not-empty PGH











