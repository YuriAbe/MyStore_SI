// Confirmação de exclusão
document.addEventListener('submit', function(e) {
    const form = e.target;
    if (form.hasAttribute('data-confirm-delete')) {
        if (!confirm(form.getAttribute('data-confirm-delete'))) {
            e.preventDefault();
        }
    }
});
