import HealthKit

class HealthDataManager: ObservableObject {
    private let healthStore = HKHealthStore()

    @Published var heartRate: Double = 0.0
    @Published var stepCount: Int = 0
    @Published var heartRateProgress: Float = 0.0
    @Published var stepCountProgress: Float = 0.0
    @Published var sleepHours: Double = 0.0
    @Published var sleepProgress: Double = 0.0
    @Published var stressLevel: Double = 0.0
    @Published var stressProgress: Float = 0.0
    @Published var temperature: Double = 0.0
    @Published var temperatureProgress: Float = 0.0
    @Published var bloodPressure: Double = 0.0
    @Published var bloodPressureProgress: Float = 0.0
    
    init() {
        requestHealthData()
    }

    func requestHealthData() {
        guard HKHealthStore.isHealthDataAvailable() else { return }

        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
        let stressType = HKObjectType.categoryType(forIdentifier: .appleStandHour)!
        let temperatureType = HKQuantityType.quantityType(forIdentifier: .bodyTemperature)!
        let bloodPressureType = HKQuantityType.quantityType(forIdentifier: .bloodPressureSystolic)!

        let typesToRead: Set<HKObjectType> = [heartRateType, stepCountType, sleepType, stressType, temperatureType, bloodPressureType]

        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { success, error in
            if success {
                self.fetchHeartRate()
                self.fetchStepCount()
                self.fetchSleepData()
                self.fetchStressData()
                self.fetchTemperature()
                self.fetchBloodPressure()
                // Add other data fetching methods as needed
            }
        }
    }
   
    private func fetchHeartRate() {
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        let query = HKStatisticsQuery(quantityType: heartRateType, quantitySamplePredicate: nil, options: .discreteAverage) { query, result, error in
            if let result = result, let value = result.averageQuantity() {
                DispatchQueue.main.async {
                    self.heartRate = value.doubleValue(for: HKUnit(from: "count/min"))
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
                    self.sleepHours = duration / 3600.0
                    self.sleepProgress = self.sleepHours / 8.0 // Assuming 8 hours is the goal
                }
            }
        }
        healthStore.execute(query)
    }

    private func fetchStressData() {
        // Implement fetching stress data
    }

    private func fetchTemperature() {
        let temperatureType = HKQuantityType.quantityType(forIdentifier: .bodyTemperature)!
        let query = HKStatisticsQuery(quantityType: temperatureType, quantitySamplePredicate: nil, options: .discreteAverage) { query, result, error in
            if let result = result, let value = result.averageQuantity() {
                DispatchQueue.main.async {
                    self.temperature = value.doubleValue(for: HKUnit.degreeCelsius())
                }
            }
        }
        healthStore.execute(query)
    }

    private func fetchBloodPressure() {
        let bloodPressureType = HKQuantityType.quantityType(forIdentifier: .bloodPressureSystolic)!
        let query = HKStatisticsQuery(quantityType: bloodPressureType, quantitySamplePredicate: nil, options: .discreteAverage) { query, result, error in
            if let result = result, let value = result.averageQuantity() {
                DispatchQueue.main.async {
                    self.bloodPressure = value.doubleValue(for: HKUnit.millimeterOfMercury())
                }
            }
        }
        healthStore.execute(query)
    }
}
