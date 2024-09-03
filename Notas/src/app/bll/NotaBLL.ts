import { NotaService } from '../services/nota.service';
export class NotaBLL {
    public async insert(notaService: NotaService, texto: string) {
        if (!notaService.database) {
            await notaService.createDb();
        }
        const sqlText = 'INSERT INTO nota(texto) VALUES (?)';
        return await notaService.database.executeSql(sqlText, [texto])
            .catch((error) => {
                console.log('error al insertar', error);
            });
    }
    public async selectAll(notaService: NotaService) {
        if (!notaService.database) {
            await notaService.createDb();
        }
        const sqlText = 'SELECT id, texto FROM nota';
        return await notaService.database.executeSql(sqlText, []).catch((error) => {
            console.log('error al selectAll', error);
        });;
    }
    public async selectById(notaService: NotaService, id: string) {
        if (!notaService.database) {
            await notaService.createDb();
        }
        const sqlText = 'SELECT id, texto FROM nota WHERE id = ?';
        return await notaService.database.executeSql(sqlText, [id]).catch((error) => {
            console.log('error al selectById', error);
        });
    }
    public async update(notaService: NotaService, texto: string, id) {
        if (!notaService.database) {
            await notaService.createDb();
        }
        const sqlText = 'UPDATE nota SET(texto) = (?) WHERE id = ?';
        return await notaService.database.executeSql(sqlText, [texto, id])
            .catch((error) => {
                console.log('error al aztualizar', error);
            });
    }
    public async delete(notaService: NotaService, id) {
        if (!notaService.database) {
            await notaService.createDb();
        }
        const sqlText = 'DELETE FROM nota WHERE id = ?';
        return await notaService.database.executeSql(sqlText, [id])
            .catch((error) => {
                console.log('error al aztualizar', error);
            });
    }
}
