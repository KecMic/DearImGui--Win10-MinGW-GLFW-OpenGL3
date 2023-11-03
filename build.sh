
# used makefile
makefile_fname=Makefile_objs    # Makefile, Makefile_objs
echo "=== using makefile |${makefile_fname}|"

# calls make (build)
echo "=== Calling make to build program(s) ==="
mingw32-make --file=${makefile_fname}

make_ret=$?

if [ ${make_ret} -ne 0 ]; then
    echo "Error while building (\$? = ${make_ret}). Not running program, but exiting..."
    exit
fi

# calls make (run)
echo "=== Calling make to run program(s) ==="
mingw32-make --file=${makefile_fname} run
