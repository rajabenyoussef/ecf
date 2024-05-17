document.addEventListener('DOMContentLoaded', async function() {
    const response = await fetch('/services');
    const services = await response.json();

    const servicesContainer = document.getElementById('services');
    const servicesList = document.createElement('ul');

    services.forEach(service => {
        const listItem = document.createElement('li');
        const link = document.createElement('a');
        link.href = `#`; // Remplacez par l'URL souhaitée pour chaque service
        link.textContent = service.nom; // Assurez-vous que votre table 'service' a une colonne 'name'
        listItem.appendChild(link);
        servicesList.appendChild(listItem);
    });

    servicesContainer.appendChild(servicesList);
});
