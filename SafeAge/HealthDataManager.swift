import HealthKit

class HealthDataManager: ObservableObject {
    private let healthStore = HKHealthStore()

    @Published var heartRate: Int = 0
    @Published var stepCount: Int = 0
    @Published var heartRateProgress: Int = 0
    @Published var stepCountProgress: Int = 0
    @Published var sleepHours: Int = 0
    @Published var sleepProgress: Int = 0
   
    @Published var temperature: Int = 0
    @Published var temperatureProgress: Int = 0
    @Published var bloodPressureSystolic: Int = 0 // Systolic pressure
    @Published var bloodPressureDiastolic: Int = 0 // Diastolic pressure
    @Published var bloodPressureProgress: Int = 0 // Progress for blood pressure
    @Published var respiratoryRate: Int = 0 // Respiratory rate
    
    init() {
        requestHealthData()
    }

    func requestHealthData() {
        guard HKHealthStore.isHealthDataAvailable() else { return }

        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
  
        let temperatureType = HKQuantityType.quantityType(forIdentifier: .bodyTemperature)!
        let bloodPressureSystolicType = HKQuantityType.quantityType(forIdentifier: .bloodPressureSystolic)!
        let bloodPressureDiastolicType = HKQuantityType.quantityType(forIdentifier: .bloodPressureDiastolic)!
        let respiratoryRateType = HKQuantityType.quantityType(forIdentifier: .respiratoryRate)!

        let typesToRead: Set<HKObjectType> = [heartRateType, stepCountType, sleepType,temperatureType, bloodPressureSystolicType, bloodPressureDiastolicType, respiratoryRateType]

        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if success {
                self.fetchHeartRate()
                self.fetchStepCount()
                self.fetchSleepData()
            
                self.fetchTemperature()
                self.fetchBloodPressure()
                self.fetchRespiratoryRate()
            }
        }
    }
   
    private func fetchHeartRate() {
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let query = HKStatisticsQuery(quantityType: heartRateType, quantitySamplePredicate: nil, options: .discreteAverage) { query, result, error in
            if let result = result, let value = result.averageQuantity() {
                DispatchQueue.main.async {
                    self.heartRate = Int(value.doubleValue(for: HKUnit.count().unitDivided(by: HKUnit.minute())))
                }
            }
        }
        healthStore.execute(query)
    }

    private func fetchStepCount() {
        let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepCountType, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            if let result = result, let value = result.sumQuantity() {
                DispatchQueue.main.async {
                    self.stepCount = Int(value.doubleValue(for: HKUnit.count()))
                }
            }
        }
        healthStore.execute(query)
    }

    private func fetchSleepData() {
        let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
        let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { query, samples, error in
            if let sample = samples?.first as? HKCategorySample {
                let duration = sample.endDate.timeIntervalSince(sample.startDate)
                DispatchQueue.main.async {
                    self.sleepHours = Int(duration / 3600.0)
                    self.sleepProgress = self.sleepHours / 8 // Assuming 8 hours is the goal
                }
            }
        }
        healthStore.execute(query)
    }

    
    private func fetchTemperature() {
        let temperatureType = HKQuantityType.quantityType(forIdentifier: .bodyTemperature)!
        let query = HKStatisticsQuery(quantityType: temperatureType, quantitySamplePredicate: nil, options: .discreteAverage) { query, result, error in
            if let result = result, let value = result.averageQuantity() {
                DispatchQueue.main.async {
                    self.temperature = Int(value.doubleValue(for: HKUnit.degreeCelsius()))
                }
            }
        }
        healthStore.execute(query)
    }

    private func fetchBloodPressure() {
        let bloodPressureSystolicType = HKQuantityType.quantityType(forIdentifier: .bloodPressureSystolic)!
        let bloodPressureDiastolicType = HKQuantityType.quantityType(forIdentifier: .bloodPressureDiastolic)!
        
        let query = HKStatisticsQuery(quantityType: bloodPressureSystolicType, quantitySamplePredicate: nil, options: .discreteAverage) { query, result, error in
            if let result = result, let value = result.averageQuantity() {
                DispatchQueue.main.async {
                    self.bloodPressureSystolic = Int(value.doubleValue(for: HKUnit.millimeterOfMercury()))
                }
            }
        }
        
        let query2 = HKStatisticsQuery(quantityType: bloodPressureDiastolicType, quantitySamplePredicate: nil, options: .discreteAverage) { query, result, error in
            if let result = result, let value = result.averageQuantity() {
                DispatchQueue.main.async {
                    self.bloodPressureDiastolic = Int(value.doubleValue(for: HKUnit.millimeterOfMercury()))
                }
            }
        }
        
        healthStore.execute(query)
        healthStore.execute(query2)
    }
    
    private func fetchRespiratoryRate() {
        let respiratoryRateType = HKQuantityType.quantityType(forIdentifier: .respiratoryRate)!
        
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: respiratoryRateType, quantitySamplePredicate: predicate, options: .discreteAverage) { query, result, error in
            if let result = result, let value = result.averageQuantity() {
                DispatchQueue.main.async {
                    self.respiratoryRate = Int(value.doubleValue(for: HKUnit.init(from: "count/min")))
                }
            }
        }
        healthStore.execute(query)
    }
}

