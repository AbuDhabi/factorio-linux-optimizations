export HUGEADM_PAGESZ
HUGEADM_PAGESZ=8192
export HUGEADM_POOLSIZE
HUGEADM_POOLSIZE=2097152

#export MIMALLOC_LARGE_OS_PAGES=1 # Use 2MiB pages
export MIMALLOC_RESERVE_HUGE_OS_PAGES=8 # Use n 1GiB pages
export MALLOC_ARENA_MAX=1 # Tell Glibc to only allocate memory in a single "arena".
export MIMALLOC_PAGE_RESET=0 # Signal when pages are empty
export MIMALLOC_EAGER_COMMIT_DELAY=4 # The first 4MiB of allocated memory won't be hugepages
export MIMALLOC_SHOW_STATS=1 # Display mimalloc stats
export MIMALLOC_PURGE_DELAY=-1 # Disabled purging

export HUGETLB_MORECORE=yes
export HUGETLB_RESTRICT_EXE=factorio

#echo "2000000" > /proc/sys/vm/nr_overcommit_hugepages
sudo sysctl -w vm.nr_overcommit_hugepages=2000000

#LD_PRELOAD="/usr/local/lib/libmimalloc.so /usr/lib/x86_64-linux-gnu/libhugetlbfs.so.0" /home/factorio/factorio/bin/x64/factorio
LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libmimalloc.so.2.1 /usr/lib/x86_64-linux-gnu/libhugetlbfs.so.0" /home/factorio/factorio/bin/x64/factorio

sudo sysctl -w vm.nr_overcommit_hugepages=0
