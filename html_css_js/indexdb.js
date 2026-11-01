// https://developer.chrome.com/blog/blob-support-for-Indexeddb-landed-on-chrome-dev/

//Crear la conexión a la base de datos e indicar la versión
const conn = indexedDB.open('wesogDB')

var db;

//Evento que se dispara cuando la base de datos se abré
conn.onsuccess = (e) => {
    db = e.target.result
    console.log('Base de datos abierta', db)
}

//Evento que se dispara cuando la base de datos se crea o se actualiza
conn.onupgradeneeded = (e) => {
    db = e.target.result
    console.log('Base de datos creada', db)
    const coleccionObjetos = db.createObjectStore('imgs')
         /* Nombre del campo, dentro del registro, qué será la identificación única */
}

//Evento que se dispara cuando la base de datos no se puede abrir
conn.onerror = (e) => { 
    console.log('Error ', e.code, " - ", e.message);
}


function add(key, value, table) {
	const transaction = bd.transaction([table], "readwrite");
	const objectStore = trasaccion.objectStore(table);
	const db_req      = objectStore.add(value, key)
	db_req.onsuccess = (e) => { console.log('Successfully added'); };
	db_req.onerror   = (e) => { console.log('Error added', e);     };
	transaction.oncomplete = () => { console.log('transaction completed'); };
}

function update(key, value, table) {
	const transaction = bd.transaction([table], "readwrite");
	const objectStore = trasaccion.objectStore(table);
	const db_req      = objectStore.put(value, key)
	db_req.onsuccess = (e) => { console.log('Successfully update'); };
	db_req.onerror   = (e) => { console.log('Error update', e);     };
	transaction.oncomplete = () => { console.log('transaction completed'); };
}


function remove(key, table) {
	const transaction = bd.transaction([table], "readwrite");
	const objectStore = trasaccion.objectStore(table);
	const db_req      = objectStore.delete(key)
	db_req.onsuccess = (e) => { console.log('Successfully update'); };
	db_req.onerror   = (e) => { console.log('Error update', e);     };
	transaction.oncomplete = () => { console.log('transaction completed'); };
}


