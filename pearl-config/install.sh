
post_install() {
    [[ -e ${PEARL_PKGVARDIR}/diff-so-fancy ]] && rm -f "${PEARL_PKGVARDIR}/diff-so-fancy"

    cd ${PEARL_PKGVARDIR}
    download https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy

    chmod +x ${PEARL_PKGVARDIR}/diff-so-fancy
    link_to_path ${PEARL_PKGVARDIR}/diff-so-fancy

    link git ${PEARL_PKGDIR}/gitconfig
}

post_update() {
    post_install
}

pre_remove() {
    unlink git ${PEARL_PKGDIR}/gitconfig

    unlink_from_path ${PEARL_PKGVARDIR}/diff-so-fancy
    rm -f "${PEARL_PKGVARDIR}/diff-so-fancy"
}
