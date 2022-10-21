import Foundation

class PersisteService {
    var excuseUsadas: [ExcuseModel] = []

    init() {
        carregarExcuses()
    }

    private func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // just send back the first one, which ought to be the only one
        return paths[0]
    }

    func persisteExcuse(excuse: ExcuseModel) {
        excuseUsadas.append(excuse)
        do {
            var data = try JSONEncoder().encode(excuseUsadas)
            let url = getDocumentsDirectory().appendingPathComponent("excuse.txt")
            try data.write(to: url)
            let input = try String(contentsOf: url)
            print(input)
            print(url)
        } catch {
            print(error.localizedDescription)
        }
    }

    private func carregarExcuses() {
        do {
            let url = getDocumentsDirectory().appendingPathComponent("excuse.txt")
            let data = try Data(contentsOf: url)
            excuseUsadas = try JSONDecoder().decode([ExcuseModel].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
